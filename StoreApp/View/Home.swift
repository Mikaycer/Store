//
//  Home.swift
//  StoreApp
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login: LoginViewModel
    @StateObject var json =  HomeViewModel()
    
    var body: some View {
        if json.datosModel.isEmpty {
            ProgressView()
        }else {
            NavigationView {
                VStack{
                    List(json.datosModel, id: \.id){ item in
                        NavigationLink(destination: UserDetail(user: item)){
                            HStack{
                                AsyncImage(url: URL(string: item.avatar)){ image in
                                    image
                                        .frame(width: 80, height: 80)
                                        .clipped()
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                }
                                VStack(alignment: .leading){
                                    Text(item.name)
                                    Text(item.role)
                                    Text(item.email)
                                }
                            }
                        }
                    }
                    Button(action:{
                        UserDefaults.standard.removeObject(forKey: "authenticated")
                        login.authenticated = 0
                    }){
                      Text("Salir")
                    }
//                    .navigationBarTitle("Lista de usuarios")
                }
                .navigationBarTitle("Lista de usuarios")
            }
        }
    }
}
    
    
    //if json.datosModel.isEmpty {
    //    ProgressView()
    //}else {
    //    Text("Lista de usuarios")
    //    Spacer()
    //    NavigationView{
    //        List(json.datosModel, id: \.id){ item in
    //            NavigationLink(destination: DetailUser(id: item.id)){
    //                HStack{
    //                    AsyncImage(url: URL(string: item.avatar)){ image in
    //                        image
    //                            .frame(width: 80, height: 80)
    //                            .clipped()
    //                            .clipShape(Circle())
    //                    } placeholder: {
    //                        ProgressView()
    //                    }
    //                    VStack(alignment: .leading){
    //                        Text(item.name)
    //                        Text(item.role)
    //                        Text(item.email)
    //                    }
    //                }
    //        }
    //        }.navigationTitle("JSON")
    //            .toolbar{
    //                HStack{
    //                    Button(action:{
    //                        UserDefaults.standard.removeObject(forKey: "sesion")
    //                        login.authenticated = 0
    //                    }){
    //                        Text("Salir")
    //                    }
    //                    //                                NavigationLink(destination: UserDetail()){
    //                    //                                    Text("Siguiente")
    //                    //                                }
    //                }
    //            }
    //    }
