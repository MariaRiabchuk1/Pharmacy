//
//  AuthEnvironment.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import ComposableArchitecture
import Combine
import Foundation

public class AuthEnvironment {
    // MARK: Properties

    public let mainQueue: AnySchedulerOf<DispatchQueue>
    public let apiManager: APIManager = APIManager()

    // MARK: Initialization

    public init(mainQueue: AnySchedulerOf<DispatchQueue>) {
        self.mainQueue = mainQueue
    }
}
