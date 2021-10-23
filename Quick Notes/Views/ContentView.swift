//
//  ContentView.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/16/21.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    let userId = Auth.auth().currentUser?.uid
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                //successfully signed in
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self]
            result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //successfully signed in
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                VStack {
//                    Text("You are signed in")
//
                    
                    HomeView()
                    
//                    Button(action: {
//                        viewModel.signOut()
//                    }, label: {
//                        Text("Sign Out")
//                            .frame(width: 200, height: 50)
//                            .foregroundColor(Color.white)
//                            .cornerRadius(20)
//                            .background(Color.blue)
//                            .padding()
//                    })
                }
            } else {
                SignInView()
            }
        }.onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

