//
//  Photo.swift
//  Snacktacular
//
//  Created by Max Pintchouk on 12/1/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class Photo: Identifiable, Codable {
    @DocumentID var id: String?
    var imageURLString = ""
    var description = ""
    var reviewer: String = Auth.auth().currentUser?.email ?? ""
    var postedOn = Date()
    
}
