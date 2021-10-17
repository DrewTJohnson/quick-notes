//
//  AuthenticationView.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import SwiftUI
import Foundation

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Quick Notes")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .fontWeight(.bold)
            TextField("Email Address", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
            SecureField("Password", text: $password)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
            
            Button(action: {
                
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                
                viewModel.signIn(email: email, password: password)
            }, label: { Text("Sign In")
                    .foregroundColor(Color.white).frame(width: 200, height: 50).cornerRadius(20).background(Color.blue)
            })
                .padding()
            
            NavigationLink("Create Account", destination: SignUpView())
                .padding()
        }.padding()
    }
}
