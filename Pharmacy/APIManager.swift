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
//
//    func readDataFromFB() -> [Drugs] {
//        db?.collection("pharmacyDrugs").getDocuments(completion: { [weak self] querySnapshot, error in
//            guard let self = self,
//                  let documents = querySnapshot?.documents else { return }
//
//            return drugs = documents.compactMap {
//                Drugs(name: $0.data()["name"] as? String ?? "",
//                      image: $0.data()["image"] as? String ?? "",
//                      description: $0.data()["description"] as? String ?? "",
//                      count: $0.data()["count"] as? Int ?? 0)
//            }
//        })
//    }
    
    func fetchDrugs() async throws -> [Drugs] {
        let snapshot = try await db?.collection("pharmacyDrugs").getDocuments()
        
        return snapshot?.documents.compactMap {
            Drugs(name: $0.data()["name"] as? String ?? "",
                  image: $0.data()["image"] as? String ?? "",
                  description: $0.data()["description"] as? String ?? "",
                  count: $0.data()["count"] as? Int ?? 0)
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

