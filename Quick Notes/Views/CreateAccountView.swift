//
//  CreateAccountView.swift
//  Quick Notes
//
//  Created by Drew Johnson on 10/17/21.
//

import SwiftUI
import Foundation

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Quick Notes")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .fontWeight(.bold)
                .padding()
            Text("Create an account")
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
            Text("An account is required to save and store notes across devices.")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
            
            Button(action: {
                
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                
                viewModel.signUp(email: email, password: password)
            }, label: { Text("Create Account")
                    .foregroundColor(Color.white).frame(width: 200, height: 50).cornerRadius(8).background(Color.blue)
            })
        }.padding()
        
        Spacer()
    }
}
