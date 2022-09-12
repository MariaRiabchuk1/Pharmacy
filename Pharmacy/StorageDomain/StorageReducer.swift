//
//  StorageReducer.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 09.09.2022.
//

import ComposableArchitecture
import SwiftUI

public typealias StorageReducer = ComposableArchitecture.Reducer<StorageState, StorageAction, StorageEnvironment>

public let storageReducer = StorageReducer.combine(
    
    drugReducer.forEach(state: \.drugsState,
                        action: /StorageAction.drugsAction(index: action:),
                        environment: {
                            .init(mainQueue: $0.mainQueue)
                        }),
    
    Reducer { state, action, environment in
        switch action {
        case .initialize:
            return .task {
                let api = APIManager()
                do {
                    let drugs = try await api.fetchDrugs()
                    return .setDrugs(drugs)
                } catch {
                    // throw error
                    return .closeStorage
                }
            }
        case .setDrugs(let drugs):
            let drugsState: [DrugState] = drugs.map {
                .init(drug: $0)
            }
            
            state.drugsState = drugsState
            state.originDrugsState = drugsState
            return .none
        case .closeStorage:
            return .none
        case .searchTextChange(let text):
            if text != "" {
                let drugsState: [DrugState] = state.drugsState.filter {
                    $0.drug.name.hasPrefix(text)
                }
                
                state.drugsState = drugsState
            } else {
                state.drugsState = state.originDrugsState
            }
            return .none
        case .drugsAction(index: let index, action: let action):
            return .none
        }
    }
).debug()
