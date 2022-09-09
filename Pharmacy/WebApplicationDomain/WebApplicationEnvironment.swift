//
//  EnvironmentWebApplication.swift
//  Pharmacy
//
//  Created by Marichka on 08.09.2022.
//

import ComposableArchitecture
import Combine
import Foundation

public class WebApplicationEnvironment {
    // MARK: Properties

    public let mainQueue: AnySchedulerOf<DispatchQueue>

    // MARK: Initialization

    public init(mainQueue: AnySchedulerOf<DispatchQueue>) {
        self.mainQueue = mainQueue
    }
}
