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
        case .save:
            let currentDrug = state.drug
            return .task {
                environment.apiManager.write(drug: currentDrug)
                return .dismiss(false)
            }
        case .incrButtonTapped(let department):
            switch department {
            case .dv:
                state.drug.drugCount.dvCount += 1
            case .eda:
                state.drug.drugCount.edaCount += 1
            case .eds:
                state.drug.drugCount.edsCount += 1
            case .fv:
                state.drug.drugCount.fvCount += 1
            case .iv:
                state.drug.drugCount.ivCount += 1
            case .nv:
                state.drug.drugCount.nvCount += 1
            case .pgv:
                state.drug.drugCount.pgvCount += 1
            case .pv:
                state.drug.drugCount.pvCount += 1
            case .rv:
                state.drug.drugCount.rvCount += 1
            case .trv:
                state.drug.drugCount.trvCount += 1
            case .tv:
                state.drug.drugCount.tvCount += 1
            case .vait:
                state.drug.drugCount.vaitCount += 1
            case .vpd:
                state.drug.drugCount.vpdCount += 1
            case .xv:
                state.drug.drugCount.xvCount += 1
            }
            return .none
        case .decrButtonTapped(let department):
            switch department {
            case .dv:
                state.drug.drugCount.dvCount -= 1
            case .eda:
                state.drug.drugCount.edaCount -= 1
            case .eds:
                state.drug.drugCount.edsCount -= 1
            case .fv:
                state.drug.drugCount.fvCount -= 1
            case .iv:
                state.drug.drugCount.ivCount -= 1
            case .nv:
                state.drug.drugCount.nvCount -= 1
            case .pgv:
                state.drug.drugCount.pgvCount -= 1
            case .pv:
                state.drug.drugCount.pvCount -= 1
            case .rv:
                state.drug.drugCount.rvCount -= 1
            case .trv:
                state.drug.drugCount.trvCount -= 1
            case .tv:
                state.drug.drugCount.tvCount -= 1
            case .vait:
                state.drug.drugCount.vaitCount -= 1
            case .vpd:
                state.drug.drugCount.vpdCount -= 1
            case .xv:
                state.drug.drugCount.xvCount -= 1
            }
            return .none
        }
    }
).debug()
