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
            state.drugs = drugs
            return .none
        case .closeStorage:
            return .none
        case .searchTextChange(let text):
            let filterdDrugs = state.drugs.filter { $0.name.contains(text) }
            if text.isEmpty {
                return Effect(value: .setDrugs(state.drugs))
            } else {
                return Effect(value: .setDrugs(filterdDrugs))
            }
        }
    }
).debug()
