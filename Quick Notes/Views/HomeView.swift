//
//  HomeView.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct HomeView: View {
    
    @State var userId: String? = Auth.auth().currentUser?.uid
    @State var title = ""
    @State var noteText = ""
    @State var showingSheet = false
    
    @State var db = Firestore.firestore()
    
    
    var body: some View {
            VStack {
                HStack {
                    Text("Quick Notes")
                        .font(.title)
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                    
                    Button("Add New") {
                        self.showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        NewNoteView()
                    }
                        .padding()
                        .navigationBarHidden(true)
                }
                Divider()
                
                NotesListView()
                
                Spacer()
                
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
