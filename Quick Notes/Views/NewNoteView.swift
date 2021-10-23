//
//  NewNoteView.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine
import FirebaseAuth

struct NewNoteView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var model = FirestoreManager()
    
    @State var userId: String? = Auth.auth().currentUser?.uid
    @State var title = ""
    @State var noteText = ""
    
    @State private var showPopover = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $title)
                    .font(.title.weight(.bold))
                    .padding()
                
                Divider()
                
                TextEditor(text: $noteText)
                    .padding()
                
                Spacer()
            }
        }
        
        Spacer()
        
        HStack {
            Button("Save", action: {
                presentationMode.wrappedValue.dismiss()
                self.model.createNote(title: title, noteText: noteText, userId: userId!)
            })
                .padding()
                .frame(width: 200, height: 50)
                .background(inputIsValid ? Color.blue : Color.gray)
                .foregroundColor(.white)
        }.padding()
            .disabled(title.isEmpty || noteText.isEmpty )
    }
    
    var inputIsValid: Bool {
        if !title.isEmpty && !noteText.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    var noteTextIsValid: Bool {
        return !noteText.isEmpty
    }

}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}
