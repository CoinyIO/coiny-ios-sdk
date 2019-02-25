//
//  CoinyKit.swift
//  CoinySDK
//
//  Created by KEMAL KOCABIYIK on 12.07.2018.
//  Copyright © 2018 KEMAL KOCABIYIK. All rights reserved.
//

import Foundation
import UIKit


public class Coiny {
    
    static var appId = "";
    static var isDevelopment = false
    private static var _authToken : String?
    public static var authToken : String? = {return _authToken}()
    
    public static func initialize(appId : String , isDevelopment : Bool = true){
        self.appId = appId
        self.isDevelopment = isDevelopment
        UserDefaults.standard.setValue(self.appId, forKey: CoinyConstants.appId)
        if(isDevelopment){
            UserDefaults.standard.setValue("https://oauth-coiny-dev.azurewebsites.net/", forKey: CoinyConstants.oauthUrl)
            UserDefaults.standard.setValue("https://api-coiny-dev.azurewebsites.net/", forKey: CoinyConstants.apiUrl)
        }else{
            UserDefaults.standard.setValue("https://oauth.coiny.io/", forKey: CoinyConstants.oauthUrl)
            UserDefaults.standard.setValue("https://api.coiny.io/", forKey: CoinyConstants.apiUrl)
        }
    }
    
    public static func login(presentingViewController : UIViewController! , delegate : CoinyLoginViewDelegate?){
        let navigationController = UINavigationController()
        let coinyViewController = CoinyLoginViewController()
        coinyViewController.delegate = delegate
        navigationController.viewControllers = [coinyViewController]
        presentingViewController.present(navigationController, animated: true, completion: nil)
    }
    
    public static func logout() {
        CoinyApiRequest.createRequest(path: "logout", parameters: nil, httpMethod: "POST", completionHandler: { (response : Void) in
            UserDefaults.standard.removeObject(forKey: CoinyConstants.accessToken)
        }, failureHandler: { (error) in
            
        })
    }
    
    public static func handleUrl(url : URL) -> String? {
        let auth_token = url.queryParameters?.first( where : { $0.key == "auth_token" } )
        _authToken = auth_token?.value
        return _authToken
    }
    
    
}
