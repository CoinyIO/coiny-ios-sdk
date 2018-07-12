//
//  CoinyKit.swift
//  CoinySDK
//
//  Created by KEMAL KOCABIYIK on 12.07.2018.
//  Copyright © 2018 KEMAL KOCABIYIK. All rights reserved.
//

import Foundation


public class Coiny {
    
    static var appId = "";
    static var appSecret = "";
    static var isDevelopment = false
    
    public static func initialize(appId : String ,appSecret : String , isDevelopment : Bool = false){
        self.appId = appId
        self.appSecret = appSecret
        self.isDevelopment = isDevelopment
        UserDefaults.standard.setValue(self.appId, forKey: CoinyConstants.appId)
        UserDefaults.standard.setValue(self.appSecret, forKey: CoinyConstants.appSecret)
        if(isDevelopment){
            UserDefaults.standard.setValue("https://api-coiny-dev.azurewebsites.net/", forKey: CoinyConstants.url)
        }else{
            UserDefaults.standard.setValue("https://api.coiny.io/", forKey: CoinyConstants.url)
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
    
    
}
