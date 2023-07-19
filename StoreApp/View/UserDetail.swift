//
//  DetailUser.swift
//  StoreApp
//

import SwiftUI

struct UserDetail: View {
    
    var user: User
//    @State private var id = ""
//    @State private var name = ""
//    @State private var email = ""
//    @State private var avatar = ""
//    @State private var role = ""
//    @State private var password = ""
//    @State private var confirmpassword = ""
    @StateObject var viewModel = UserDetailViewModel()
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: user.avatar)){ image in
                image
                    .frame(width: 80, height: 80)
                    .clipped()
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                HStack{
                    Text("Id").foregroundColor(.blue).bold()
                    Text("\(user.id)").foregroundColor(.black)
                    Spacer()
                }
                HStack{
                    Text("Nombre").foregroundColor(.blue).bold()
                    Text(user.name).foregroundColor(.black)
                }
                HStack{
                    Text("Email").foregroundColor(.blue).bold()
                    Text(user.email).foregroundColor(.black)
                }
                HStack{
                    Text("role").foregroundColor(.blue).bold()
                    Text(user.role).foregroundColor(.black)
                }
            }.padding(.bottom, 10)
            
            VStack{
                Text("Editar información").font(.title3)
                HStack{
                    Text("Email").foregroundColor(.blue).bold()
                    Spacer()
                }
                TextField(user.email, text: $viewModel.email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                HStack{
                    Text("Nombre").foregroundColor(.blue).bold()
                    Spacer()
                }
                TextField(user.name, text: $viewModel.name)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    viewModel.editUser()
                }){
                    Text("Acceder").foregroundColor(.white).bold()
                }.background(.blue)
                    .buttonStyle(.bordered)
    //                .buttonBorderShape(.roundedRectangle(radius: 10))
                    .cornerRadius(8)
            }

            
        }.padding()
    }
}

