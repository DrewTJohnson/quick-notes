//
//  NoteRespository.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

public struct Note: Codable {
    
    let title: String
    let noteText: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case noteText
    }

}

class FirestoreManager: ObservableObject {
    
    func createNote(title: String, noteText: String) {
        
        let docData: [String: Any] = [
            "title": title,
            "note": noteText,
            "dateAdded": Timestamp(date: Date()),
        ]
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("Notes").document(title)
        
        docRef.setData(docData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written")
            }
        }
    }
}
