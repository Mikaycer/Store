//
//  UserRegister.swift
//  StoreApp
//

import SwiftUI

struct UserRegister: View {
    
    @State private var showingAlert = false
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @StateObject var viewModel = UserRegisterViewModel()
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Text("Registro").foregroundColor(.blue).bold()
            Form{
                Text("name").foregroundColor(.blue).bold()
                TextField("nombre", text: $viewModel.name)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                Text("Email").foregroundColor(.blue).bold()
                TextField("Correo", text: $viewModel.email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                Text("Contraseña").foregroundColor(.blue).bold()
                SecureTextField(text: $viewModel.password)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Confirmar contraseña")
                SecureTextField(text: $viewModel.confirmPassword)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    viewModel.register()
                    showAlert = true
//                    if viewModel.message.isEmpty {
//                        ProgressView()
//                    }else{
//                        showAlert = true
//                    }
                }){
                    Text("Acceder").foregroundColor(.white).bold()
                }.background(.blue)
                    .buttonStyle(.bordered)
                //                .buttonBorderShape(.roundedRectangle(radius: 10))
                    .cornerRadius(8)
                
            }
            .alert("Mensaje", isPresented: $showAlert){
                Button("ok"){
                    if viewModel.message == "Registro exitoso"{
//                        Login()
                    }
                }
            } message: {
                Text("\(viewModel.message)")
            }
        }.padding()
    }
}
