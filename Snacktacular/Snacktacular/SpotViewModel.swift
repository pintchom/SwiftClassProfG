//
//  SpotViewModel.swift
//  Snacktacular
//
//  Created by Max Pintchouk on 11/10/24.
//

import Foundation
import FirebaseFirestore

@Observable
class SpotViewModel {
    static func saveSpot(spot: Spot) async -> String? {
        let db = Firestore.firestore()
        if let id = spot.id {
            do {
                try db.collection("spots").document(id).setData(from: spot)
                return id
            } catch {
                print("Failed uploading data \(error.localizedDescription)")
                return id
            }
        } else {
            do {
                let docref = try db.collection("spots").addDocument(from: spot)
                return docref.documentID
            } catch {
                print("Failed uploading data \(error.localizedDescription)")
                return nil
            }
        }
    }
    
    static func deleteSpot(spot: Spot) {
        let db = Firestore.firestore()
        guard let id = spot.id else {
            print("NO SPOT ID")
            return
        }
        Task {
            do {
                try await db.collection("spots").document(id).delete()
            } catch {
                print("Could not delete: \(error.localizedDescription)")
            }
        }
    }
}
