//
//  APIManager.swift
//  Pharmacy
//
//  Created by Marichka on 08.09.2022.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore

class APIManager {
    
    let db: Firestore?
    
    init() {
        db = Firestore.firestore()
        db?.settings = FirestoreSettings()
    }
    
    func fetchDrugs() async throws -> [Drugs] {
        let snapshot = try await db?.collection("pharmacyDrugs").getDocuments()
        
        return snapshot?.documents.compactMap {
            Drugs(name: $0.data()["name"] as? String ?? "",
                  image: $0.data()["image"] as? String ?? "",
                  description: $0.data()["description"] as? String ?? "",
                  totalCount: $0.data()["totalCount"] as? Int ?? 0,
                  dvCount: $0.data()["dvCount"] as? Int ?? 0,
                  edaCount: $0.data()["edaCount"] as? Int ?? 0,
                  edsCount: $0.data()["edsCount"] as? Int ?? 0,
                  fvCount: $0.data()["fvCount"] as? Int ?? 0,
                  ivCount: $0.data()["ivCount"] as? Int ?? 0,
                  nvCount: $0.data()["nvCount"] as? Int ?? 0,
                  pgvCount: $0.data()["pgvCount"] as? Int ?? 0,
                  pvCount: $0.data()["pvCount"] as? Int ?? 0,
                  rvCount: $0.data()["rvCount"] as? Int ?? 0,
                  trvCount: $0.data()["trvCount"] as? Int ?? 0,
                  tvCount: $0.data()["tvCount"] as? Int ?? 0,
                  vaitCount: $0.data()["vaitCount"] as? Int ?? 0,
                  vpdCount: $0.data()["vpdCount"] as? Int ?? 0,
                  xvCount: $0.data()["xvCount"] as? Int ?? 0)
        } ?? []
    }
    
    func write(name: String, image: String, description: String, count: Int) {
        db?.collection("pharmacyDrugs").document(name).setData([
            "name": name,
            "image": image,
            "description": description,
            "count": count
        ])
    }
}

