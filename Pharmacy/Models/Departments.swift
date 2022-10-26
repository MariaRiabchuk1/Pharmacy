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
            return "Відділення анестезіології та інтенсивної терапії"
        case .vpd:
            return "Відділення паліативної допомоги"
        case .dv:
            return "Дитяче відділення"
        case .iv:
            return "Інфекційне відділення"
        case .nv:
            return "Неврологічне відділення"
        case .pv:
            return "Поліклінічне відділення"
        case .pgv:
            return "Пологово-гінекологічне відділення"
        case .rv:
            return "Реабілітаційне відділення"
        case .tv:
            return "Терапевтичне відділення"
        case .trv:
            return "Травматологічне відділення"
        case .fv:
            return "Фізіотерапевтичне відділення"
        case .xv:
            return "Хірургічне відділення"
        case .eda:
            return "Відділення екстренної (невідкладної) медичної допомоги (амб)"
        case .eds:
            return "Відділення екстренної (невідкладної) медичної допомоги (стац)"
        }
    }
}
