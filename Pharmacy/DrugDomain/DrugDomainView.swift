//
//  DrugDomainView.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import SwiftUI
import ComposableArchitecture

public struct DrugDomainView: View {
    private let store: Store<DrugState, DrugAction>

    public init(store: Store<DrugState, DrugAction>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text(viewStore.state.drug.name)
            }
            .onTapGesture {
                viewStore.send(.openDetail)
            }
            .fullScreenCover(isPresented: viewStore.binding(get: \.detailSheetisActive,
                                                           send: DrugAction.dismiss)) {
                DrugDetailDomainView(store: store)
            }
        }
    }
}


public struct DrugDetailDomainView: View {
    private let store: Store<DrugState, DrugAction>

    public init(store: Store<DrugState, DrugAction>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                
                VStack {
                    if let url = URL(string: viewStore.drug.image) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 250, height: 500)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                }
                .padding(30)
                
                Divider()
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(viewStore.drug.name)
                        .padding()
                        .font(.system(size: 22))
                    
                    Text(viewStore.drug.description)
                        .padding()
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Button {
                        viewStore.send(.dismiss(false))
                    } label: {
                        Text("Close")
                    }
                    .frame(width: 100, height: 40, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                }
                .padding(30)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .padding()
        }
    }
}

