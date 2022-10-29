//
//  DashboardViewDomain.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 05.09.2022.
//

import SwiftUI
import ComposableArchitecture

struct DashboardViewDomain: View {
    
    // MARK: Properties

    let store: Store<DashboardState, DashboardAction>
    
    // MARK: Initialization

    public init(store: Store<DashboardState, DashboardAction>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                navigationBar
                
                Spacer()

                dashboard
                

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.white)
            .onAppear {
                viewStore.send(.initialize)
            }
            .fullScreenCover(isPresented: viewStore.binding(get: \.isStorageActive,
                                                           send: DashboardAction.dismissStorage)) {
                StorageDomainView(store: self.store.scope(state: \.storageState,
                                                                 action: DashboardAction.storageAction))
            }
            .fullScreenCover(isPresented: viewStore.binding(get: \.isWebApplicationActive,
                                                           send: DashboardAction.dismissWebView)) {
                WebApplicationDomainView(store: self.store.scope(state: \.webApplicationState,
                                                                 action: DashboardAction.webApplicationAction))
            }
        }
    }
    
    var dashboard: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 50) {
                HStack(spacing: 100) {
                    buildButton(title: "Google", image: "google", subTitle: "Відкрити сторінку Google")  {
                        viewStore.send(.googleButtonTapped)
                    }
                    
                    buildButton(title: "Medics", image: "medics", subTitle: "Відкрити сторінку Medics") {
                        viewStore.send(.medicsButtonTapped)
                    }
                    
                    buildButton(title: "WebMail", image: "mail", subTitle: "Відкрити сторінку WebMail") {
                        viewStore.send(.gmailButtonTapped)
                    }
                }
                
                HStack(spacing: 100) {
                    buildButton(title: "Site", image: "site", subTitle: "Відкрити офіційну сторінку лікарні") {
                        viewStore.send(.knpButtonTapped)
                    }
                    buildButton(title: "Recipe", image: "recipe", subTitle: "Виписати рецепт") {
                        viewStore.send(.drugsButtonTapped)
                    }
                    
                    if viewStore.state.currentUser?.rules == "admin" {
                        buildButton(title: "Storage", image: "storage", subTitle: "Склад ліків") {
                            viewStore.send(.storageButtonTapped)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.white)
        }
    }

    
    var navigationBar: some View {
        // Navigation bar
        WithViewStore(store) { viewStore in
            HStack {
                // TODO: Sasha | replace by logo image
                Image("logo")
                    .resizable()
                    .frame(width: 80, height: 100, alignment: .center)
                    .background(Color.white)
                    .shadow(radius: 0)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Головні новини")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                       
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.")
                }
                .padding()
                .frame(width: 800, height: 105)
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Добрий день,")
                        
                        Text(viewStore.state.currentUser?.userName ?? "Ім'я")
                            .bold()
                    }
                    .padding()
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 50, height: 60, alignment: .center)
                }
                .padding()
                .padding(.horizontal, 20)
            }
            .padding(.leading, 60)
            .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 100, alignment: .center)
            .background(Color.customYellow)
            .shadow(radius: 4)
        }
    }
}

struct DashboardViewDomain_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewDomain(store: Store(
            initialState: DashboardState(),
            reducer: reducer,
            environment: DashboardEnvironment(mainQueue: .main, apiManager: APIManager())
        ))
        .previewInterfaceOrientation(.landscapeRight)
    }
}

extension DashboardViewDomain {
    @ViewBuilder
    private func buildButton(title: String, image: String, subTitle: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(title)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(subTitle)
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(width: 230)
            }
            .padding(35)
            .frame(width: 250, height: 250, alignment: .center)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 10)
        }
    }
}
