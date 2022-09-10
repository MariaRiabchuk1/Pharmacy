//
//  AuthDomainView.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import SwiftUI
import ComposableArchitecture

struct AuthDomainView: View {
    
    let store: Store<AuthState, AuthAction>
    
    // MARK: Initialization
    
    public init(store: Store<AuthState, AuthAction>) {
        self.store = store
    }
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 200, alignment:.center)
                    .background(Color.white)
                    .shadow(radius: 0)
                    .padding()
                
                Text("Log in")
                    .font(.system(size: 30))
                
                Spacer()
                
                TextField(
                    "Емайл",
                    text: viewStore.binding(
                        get: \.emailQuery, send: AuthAction.emailQueryChanged
                    )
                )
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .frame(width: 200, height: 50, alignment: .center)
                .textFieldStyle(.roundedBorder)
                
                TextField(
                    "Пароль",
                    text: viewStore.binding(
                        get: \.passwordQuery, send: AuthAction.passwordQueryChanged
                    )
                )
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .frame(width: 200, height: 50, alignment: .center)
                .textFieldStyle(.roundedBorder)
                
                
                Spacer()
                
                Button {
                    viewStore.send(.logInButtonTapped)
                } label: {
                    Text("Логін")
                        .frame(width: 100, height: 50, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .alert(
                    self.store.scope(state: \.alert),
                    dismiss: .alertConfirmTapped
                  )
                Spacer()
            }
            .frame(maxWidth: UIScreen.main.bounds.width / 2, maxHeight: .infinity, alignment: .center)
            .background(Color.white)
            .padding()
            .cornerRadius(10)
            .shadow(radius: 20)
            
            .fullScreenCover(isPresented: viewStore.binding(get: \.isUserValid,
                                                            send: AuthAction.dismiss)) {
                
                DashboardViewDomain(store: self.store.scope(state: \.dashboardState,
                                                                 action: AuthAction.dashboardAction))
            }
            
        }
        
    }
}

struct AuthDomainView_Previews: PreviewProvider {
    static var previews: some View {
        AuthDomainView(store: Store(
            initialState: .init(),
            reducer: authReducer,
            environment: .init(mainQueue: .main)
        ))
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
