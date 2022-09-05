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

    let store: Store<StateDashboard, ActionDashboard>

    // MARK: Initialization

    public init(store: Store<StateDashboard, ActionDashboard>) {
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
        }
    }
    
    @ViewBuilder
    private func buildButton(title: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: "doc")
                    .resizable()
                    .frame(width: 50, height: 60, alignment: .center)
                
                Spacer()
                
                Text(title)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                Text("Subtitle")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .padding(35)
            .frame(width: 250, height: 250, alignment: .center)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 10)
        }

    }
    
    var dashboard: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 50) {
                
                HStack(spacing: 100) {
                    
                    buildButton(title: "Google") {
                        viewStore.send(.googleButtonTapped)
                    }
                    
                    buildButton(title: "Medics") {
                        viewStore.send(.medicsButtonTapped)
                    }
                    
                    buildButton(title: "Gmail") {
                        viewStore.send(.gmailButtonTapped)
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
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(viewStore.state.selectedCell)
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                       
                    Text("News News News News News News News News News")
                }
                .padding()
                
                Spacer()
            }
            .padding(.leading, 100)
            .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
            .background(Color.cyan)
            .shadow(radius: 2)
        }

    }
    
}

struct DashboardViewDomain_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewDomain(store: Store(
            initialState: StateDashboard(),
            reducer: reducer,
            environment: EnvironmentDashboard(mainQueue: .main)
        ))
        .previewInterfaceOrientation(.landscapeRight)
    }
}
