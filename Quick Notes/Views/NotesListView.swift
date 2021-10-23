//
//  NotesListView.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import SwiftUI

struct NotesListView: View {
    
    @ObservedObject private var viewModel = ListNotes()
    
    var body: some View {
        NavigationView {
            List(viewModel.notes) { note in
                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(.headline)
                }
            }
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
