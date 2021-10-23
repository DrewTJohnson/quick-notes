//
//  NoteRespository.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import Combine
import GRDB

class Note: Codable, Identifiable {
    
    let title: String
    let noteText: String
    let userId: String
//    let isCurrentUser: Bool
    
    enum CodingKeys: String, CodingKey {
        case title
        case noteText
        case userId
//        case isCurrentUser = "isCurrentUser"
    }
    
    init (userId: String, title: String, noteText: String) {
        self.userId = userId
        self.title = title
        self.noteText = noteText
//        self.isCurrentUser = Auth.auth().currentUser?.uid == self.userId
    }

}

class FirestoreManager: ObservableObject {
    
    func createNote(title: String, noteText: String, userId: String) {
        
        let docData: [String: Any] = [
            "userId": userId,
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

class ListNotes: ObservableObject {
    @Published var notes = [Note]()
    
    private var db = Firestore.firestore()
    
    private var user = Auth.auth().currentUser
    
    func fetchData() {
        db.collection("Notes").whereField("userId", isEqualTo: user?.uid as Any).addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.notes = documents.map { (queryDocumentSnapshot) -> Note in
                let data = queryDocumentSnapshot.data()
                
                let userId = data["userId"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let noteText = data["note"] as? String ?? ""
                
                return Note(userId: userId, title: title, noteText: noteText)
            }
        }
    }
}
