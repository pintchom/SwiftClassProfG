//
//  PhotoViewModel.swift
//  Snacktacular
//
//  Created by Max Pintchouk on 12/1/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

class PhotoViewModel {
    static func saveImage(spot: Spot, photo: Photo, data: Data) async {
        guard let id = spot.id else {
            print("Error: should gave an id")
            return
        }
        let storage = Storage.storage().reference()
        let metadata = StorageMetadata()
        if photo.id == nil {
            photo.id = UUID().uuidString
        }
        metadata.contentType = "image/jpeg"
        let path = "\(id)/\(photo.id ?? "n/a")"
        
        do {
            let storageref = storage.child(path)
            let returnedMetaData = try await storageref.putDataAsync(data, metadata: metadata)
            print("SAVED")
            guard let url = try? await storageref.downloadURL() else {
                print("Could not get download url")
                return
            }
            photo.imageURLString = url.absoluteString
            print(photo.imageURLString)
            let db = Firestore.firestore()
            do {
                try db.collection("spots").document(id).collection("photos").document(photo.id ?? "n/a").setData(from: photo)
            } catch {
                print("Could not update data in spots/\(id)/photos/\(photo.id ?? "n/a"). \(error.localizedDescription)")
            }
                    
        } catch {
            print("Error putting image")
        }
    }
}
