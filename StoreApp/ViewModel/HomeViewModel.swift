//
//  HomeViewModel.swift
//  StoreApp
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var datosModel : [User] = []
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        ApiManager().request(modelType: [User].self, endpoint: "api/v1/users", method: "GET"){ response in
            switch response{
            case .success(let users):
                DispatchQueue.main.async {
                    print(users)
                    self.datosModel = users
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
