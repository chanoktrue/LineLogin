//
//  LineLoginViewModel.swift
//  LineLoginDemo
//
//  Created by Thongchai Subsaidee on 31/8/2564 BE.
//

import SwiftUI
import LineSDK

class LineLoginViewModel: ObservableObject {
    
    @Published  var userID: String = ""
    @Published  var displayName: String = ""
    @Published var email: String = ""
    @Published  var pictureURL: UIImage?
    
    func login() {
        LoginManager.shared.login(permissions: [.profile, .openID,  .email]) { result in
            switch result {
            case .success(let loginResult):
                
                let jwt = loginResult.accessToken.IDToken
                self.userID = jwt?.payload.subject ?? ""
                self.email = jwt?.payload.email ?? ""
                self.displayName = jwt?.payload.name ?? ""
                self.pictureURL = self.getPhoto(url: jwt?.payload.pictureURL)
  
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPhoto(url: URL?) -> UIImage? {
        let data = try? Data(contentsOf: url!)
        return UIImage(data: data!)
    }
    
}
