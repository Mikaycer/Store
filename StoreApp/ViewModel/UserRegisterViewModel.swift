//
//  UserRegisterViewModel.swift
//  StoreApp
//

import Foundation

class UserRegisterViewModel: ObservableObject {
    
//    @Published var user:  User
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var message = ""
    
    init() {}
    
    func register(){
        guard validate() else {
            return
        }
//        joined = Date().timeIntervalSince1970
        let headers = ["Content-Type": "application/json"]
        let data = UserRegisterEntity(name: name, email: email, password: password, avatar: "https://api.lorem.space/image/face?w=640&h=480&r=867")
        let json = try? JSONEncoder().encode(data)
//        let json = try? JSONSerialization.data(withJSONObject: ["name": name, "email": email, "password": password, "avatar": "https://api.lorem.space/image/face?w=640&h=480&r=867"], options: [])
//        let dataprueba = userpruebaresponse(name: name, job: name)
//        let jsonprueba = try? JSONEncoder().encode(dataprueba)
        
        ApiManager().request(modelType: userReponsesPost.self, endpoint: "api/v1/users/", method: "POST", body: json){ response in
            switch response{
            case .success(let user):
                DispatchQueue.main.async {
                    self.message = "Registro exitoso"
                    print(user)
//                    self.user = user
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    self.message = "error"
                }
            }
        }
        
//        ApiManager().request(modelType: UserResponse.self, endpoint: "api/v1/users/", method: "POST", body: json){ response in
//            switch response{
//            case .success(let user):
//                DispatchQueue.main.async {
//                    print(user)
////                    self.user = user
//                    self.message = "Registro exitoso"
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//                DispatchQueue.main.async {
//                    print(error.localizedDescription)
//                    self.message = "error"
//                }
//            }
//        }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.message = "Datos incompletos"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            self.message = "correo no valido"
            return false
        }
        guard password == confirmPassword else {
            self.message = "contraseña no coincide"
            return false
        }
        return true
    }
}
