//
//  NewNoteView.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import SwiftUI

struct NewNoteView: View {
    
    @State var title = ""
    @State var noteText = ""
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .font(.title.weight(.bold))
                .padding()
            
            Divider()
            
            TextEditor(text: $noteText)
                .padding()
            
            Spacer()
        }
        
        Spacer()
        
        HStack {
            Button("Save", action: {})
                .padding()
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
        }.padding()
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}
