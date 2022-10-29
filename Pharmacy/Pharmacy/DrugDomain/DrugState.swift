//
//  DrugState.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import Foundation

public struct DrugState: Equatable, Identifiable {
    public var id = UUID()
    
    public var drug: Drugs
    
    public var detailSheetisActive: Bool = false
    
    // MARK: - Properties
    
    // MARK: States
    
    public init(drug: Drugs) {
        self.drug = drug
    }
}
