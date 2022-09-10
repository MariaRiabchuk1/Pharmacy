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
                    .searchable(text: viewStore.binding(get: \.searchText, send: StorageAction.searchTextChange))
                    .navigationTitle("Storage")
                    
                    
                    Button {
                        viewStore.send(.closeStorage)
                    } label: {
                        Text("Close")
                    }
                    
                }
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
    

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
