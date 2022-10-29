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

public class APIManager {
    
    let db: Firestore?
    let auth = AuthService()
    
    init() {
        db = Firestore.firestore()
        db?.settings = FirestoreSettings()
    }
    
    public func fetchDrugs() async throws -> [Drugs] {
        #if DEBUG
        let snapshot = try await db?.collection("Drugs").getDocuments()
        #else
        let snapshot = try await db?.collection("pharmacyDrugs").getDocuments()
        #endif
        return snapshot?.documents.compactMap {
            Drugs(documentID: $0.documentID,
                  name: $0.data()["name"] as? String ?? "",
                  image: $0.data()["image"] as? String ?? "",
                  description: $0.data()["description"] as? String ?? "",
                  drugCount: .init(totalCount: $0.data()["totalCount"] as? Int ?? 0,
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
                                   xvCount: $0.data()["xvCount"] as? Int ?? 0))
        } ?? []
    }
    
    public func fetchUsers() async throws -> [MedicalUser] {
        let snapshot = try await db?.collection("users").getDocuments()
        
        return snapshot?.documents.compactMap {
            MedicalUser(userName: $0.data()["userName"] as? String ?? "",
                 email: $0.data()["email"] as? String ?? "",
                    rules: $0.data()["rules"] as? String ?? "",
                 userID: $0.data()["userID"] as? String ?? "",
                 icon: $0.data()["icon"] as? String ?? "")
        } ?? []
    }
    
    public func getCurrentUser() async throws -> MedicalUser? {
        guard let currentUser = await auth.getCurrentUser() else {
            return nil
        }
        
        return try await fetchUsers().first { $0.userID == currentUser.uid }
    }
    
    public func write(drug: Drugs) {
#if DEBUG
        let name = "Drugs"
#else
        let name = "pharmacyDrugs"
#endif
        db?.collection(name).document(drug.documentID).setData([
            "name": drug.name,
            "image": drug.image,
            "description": drug.description,
            "totalCount": drug.drugCount.totalCount,
            "dvCount": drug.drugCount.dvCount,
            "edaCount": drug.drugCount.edaCount,
            "edsCount": drug.drugCount.edsCount,
            "fvCount": drug.drugCount.fvCount,
            "ivCount": drug.drugCount.ivCount,
            "nvCount": drug.drugCount.nvCount,
            "pgvCount": drug.drugCount.pgvCount,
            "pvCount": drug.drugCount.pvCount,
            "rvCount": drug.drugCount.rvCount,
            "trvCount": drug.drugCount.trvCount,
            "tvCount": drug.drugCount.tvCount,
            "vaitCount": drug.drugCount.vaitCount,
            "vpdCount": drug.drugCount.vpdCount,
            "xvCount": drug.drugCount.xvCount
        ])
    }
}
