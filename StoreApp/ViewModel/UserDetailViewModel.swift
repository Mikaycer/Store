//
//  DetailUserViewModel.swift
//  StoreApp
//

import Foundation

class UserDetailViewModel: ObservableObject {
    
//    @Published var user:  User
    @Published var id = ""
    @Published var name = ""
    @Published var email = ""
    @Published var message = ""
    
    init() {}
    
    func editUser(){
        guard validate() else {
            return
        }
//        joined = Date().timeIntervalSince1970
        let data = changeUser(name: name, email: email)
        print("info data \(data)")
        let json = try? JSONEncoder().encode(data)
        ApiManager().request(modelType: UserResponse.self, endpoint: "api/v1/users/\(id)", method: "PUT", body: json, token: UserDefaults.standard.string(forKey: "access_token")){ response in
            switch response{
            case .success(let user):
                DispatchQueue.main.async {
                    print(user)
//                    self.user = user
                    self.message = "Cambio exitoso"
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    self.message = "error"
                }
            }
        }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.message = "Datos incompletos"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            self.message = "correo no valido"
            return false
        }
        
        return true
    }
}
