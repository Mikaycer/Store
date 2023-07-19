//
//  LoginViewModel.swift
//  StoreApp
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var authenticated = 0
    init(){
        if let session = UserDefaults.standard.object(forKey: "authenticated") as? Int{
            print(UserDefaults.standard.string(forKey: "access_token"))
            self.authenticated = session
        }else {
            self.authenticated = 0
        }
    }
    
    func login(email:String, password:String) {
        let data = LoginRequestBody(email: email, password: password)
        let json = try? JSONEncoder().encode(data)
        ApiManager().request(modelType: token.self, endpoint: "api/v1/auth/login", method: "POST", body: json){ response in
            switch response{
            case .success(let token):
                DispatchQueue.main.async {
                    UserDefaults.standard.set(1, forKey: "sesion")
                    print(token.access_token)
                    UserDefaults.standard.set(token.access_token, forKey: "access_token")
                    UserDefaults.standard.set(token.refresh_token, forKey: "refresh_token")
                    UserDefaults.standard.set(1, forKey: "authenticated")
                    self.authenticated = 1
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.authenticated = 0
                    print(error.localizedDescription)
                }
            }
        }
    }
}
