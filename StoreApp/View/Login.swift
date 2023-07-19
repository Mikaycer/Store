//
//  Login.swift
//  StoreApp
//

import SwiftUI

struct Login: View {
    
//    john@mail.com
//    changeme
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var login: LoginViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Email").foregroundColor(.blue).bold()
                TextField("Correo", text: $email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                Text("Contraseña").foregroundColor(.white).bold()
                SecureTextField(text: $password)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    login.login(email: email, password: password)
                }){
                    Text("Acceder").foregroundColor(.white).bold()
                }.background(.blue)
                    .buttonStyle(.bordered)
    //                .buttonBorderShape(.roundedRectangle(radius: 10))
                    .cornerRadius(8)
                HStack{
                    Text("Aún no tiene cuenta?")
                    NavigationLink("Registrarse", destination: UserRegister())
                }
            }.padding()
        }
    }
}
    
struct SecureTextField: View {
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View{
        HStack{
            if isSecureField {
                SecureField("Contraseña", text: $text)
            }else {
                TextField(text, text: $text)
            }
        }.overlay(alignment: .trailing){
            Image(systemName: isSecureField ? "eye.slash": "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}
