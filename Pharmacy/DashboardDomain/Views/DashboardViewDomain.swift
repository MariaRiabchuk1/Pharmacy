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
                    buildButton(title: "Site") {
                        viewStore.send(.googleButtonTapped)
                    }
                    
                    buildButton(title: "Medics") {
                        viewStore.send(.medicsButtonTapped)
                    }
                    
                    buildButton(title: "WebMail") {
                        viewStore.send(.gmailButtonTapped)
                    }
                }
                
                HStack(spacing: 100) {
                    if viewStore.state.currentUser?.rules == "admin" {
                        buildButton(title: "Storage") {
                            viewStore.send(.storageButtonTapped)
                            
                        }
                        
                        buildButton(title: "Drugs") {
                            viewStore.send(.drugsButtonTapped)
                            
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
                    .frame(width: 70, height: 80, alignment:.center)
                    .background(Color.white)
                    .shadow(radius: 0)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Головні новини")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                       
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do")
                }
                .padding()
                
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
                        .frame(width: 50, height: 80, alignment: .center)
                }
                .padding()
                .padding(.horizontal, 20)
            }
            .padding(.leading, 60)
            .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 100, alignment: .center)
            .background(Color.summerGreen)
            .shadow(radius: 7)
        }
    }
}

struct DashboardViewDomain_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewDomain(store: Store(
            initialState: DashboardState(),
            reducer: reducer,
            environment: DashboardEnvironment(mainQueue: .main)
        ))
        .previewInterfaceOrientation(.landscapeRight)
    }
}

extension DashboardViewDomain {
    @ViewBuilder
    private func buildButton(title: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: "doc")
                    .resizable()
                    .frame(width: 50, height: 60, alignment: .center)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(title)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("Subtitle")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
            .padding(35)
            .frame(width: 250, height: 250, alignment: .center)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 10)
        }
    }
}
