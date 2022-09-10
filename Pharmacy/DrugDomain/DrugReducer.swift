//
//  DrugReducer.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import ComposableArchitecture
import SwiftUI

public typealias DrugReducer = ComposableArchitecture.Reducer<DrugState, DrugAction, DrugEnvironment>

public let drugReducer = DrugReducer.combine(
    Reducer { state, action, environment in
        switch action {
        case .initialize:
            return .none
        case .openDetail:
            state.detailSheetisActive = true
            return .none
        case .dismiss(let isActive):
            state.detailSheetisActive = isActive
            return .none
        }
    }
).debug()
