//
//  ReducerWebApplication.swift
//  Pharmacy
//
//  Created by Marichka on 08.09.2022.
//

import ComposableArchitecture
import SwiftUI

public typealias WebApplicationReducer = ComposableArchitecture.Reducer<WebApplicationState, WebApplicationAction, WebApplicationEnvironment>

public let webApplicationReducer = WebApplicationReducer.combine(
    Reducer { state, action, environment in
        switch action {
        case .initialize:
            return .none
        }
    }
).debug()
