//
//  Departments.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import Foundation

public enum Departments {
    case vait
    case vpd
    case dv
    case iv
    case nv
    case pv
    case pgv
    case rv
    case tv
    case trv
    case fv
    case xv
    case eda
    case eds
}

extension Departments {
    
    // TODO: - MARICHKA | Complete fullname for each department.
    
    var fullName: String {
        switch self {
        case .vait:
            return ""
        case .vpd:
            return ""
        case .dv:
            return ""
        case .iv:
            return ""
        case .nv:
            return ""
        case .pv:
            return ""
        case .pgv:
            return ""
        case .rv:
            return ""
        case .tv:
            return ""
        case .trv:
            return ""
        case .fv:
            return ""
        case .xv:
            return ""
        case .eda:
            return ""
        case .eds:
            return ""
        }
    }
}
