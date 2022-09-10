//
//  DrugEnvironment.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import ComposableArchitecture
import Combine
import Foundation

public class DrugEnvironment {
    // MARK: Properties

    public let mainQueue: AnySchedulerOf<DispatchQueue>

    // MARK: Initialization

    public init(mainQueue: AnySchedulerOf<DispatchQueue>) {
        self.mainQueue = mainQueue
    }
}
