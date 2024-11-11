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
    static func saveSpot(spot: Spot) -> Bool {
        let db = Firestore.firestore()
        if let id = spot.id {
            do {
                try db.collection("spots").document(id).setData(from: spot)
                return true
            } catch {
                print("Failed uploading data \(error.localizedDescription)")
                return false
            }
        } else {
            do {
                try db.collection("spots").addDocument(from: spot)
                return true
            } catch {
                print("Failed uploading data \(error.localizedDescription)")
            }
        }
        return true
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
