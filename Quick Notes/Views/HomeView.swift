//
//  HomeView.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
            VStack {
                HStack {
                    Text("Quick Notes")
                        .font(.title)
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink("Add New", destination: NewNoteView())
                        .padding()
                        .navigationBarHidden(true)
                }
                Divider()
                
                Spacer()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
