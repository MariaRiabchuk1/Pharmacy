//
//  StorageDomainView.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 09.09.2022.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct StorageDomainView: View {
    let store: Store<StorageState, StorageAction>
    
    // MARK: Initialization
    
    public init(store: Store<StorageState, StorageAction>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack {
                    List {
                        ForEachStore(
                            store.scope(state: \.drugsState,
                                        action: StorageAction.drugsAction(index: action:))
                        ) {
                            DrugDomainView(store: $0)
                        }
                    }
                    
                    Button {
                        viewStore.send(.closeStorage)
                    } label: {
                        Text("Закрити")
                    }
                    
                }
                .navigationTitle("Склад")
                .searchable(text: viewStore.binding(get: \.searchText, send: StorageAction.searchTextChange))
                .refreshable {
                    viewStore.send(.initialize)
                }
                .onAppear {
                    viewStore.send(.initialize)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}
