//
//  WebApplicationDomain.swift
//  Pharmacy
//
//  Created by Marichka on 08.09.2022.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct WebApplicationDomainView: View {
    let store: Store<WebApplicationState, WebApplicationAction>

    // MARK: Initialization

    public init(store: Store<WebApplicationState, WebApplicationAction>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                if let url = viewStore.currentURL {
                    SafariView(url: url)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}
