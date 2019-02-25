//
//  ViewController.swift
//  Sample
//
//  Created by KEMAL KOCABIYIK on 12.07.2018.
//  Copyright © 2018 KEMAL KOCABIYIK. All rights reserved.
//

import UIKit

class ViewController: UIViewController , CoinyLoginViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoinyApiRequest.createRequest(path: "transactions", parameters: nil, httpMethod: "GET", completionHandler: { (data : ResponseWrapper<Array<TransactionResponse>>) in
            
            print(data)
        } ,failureHandler :{ (error) in
            
        })
        
        CoinyApiRequest.createRequest(path: "wallets", parameters: nil, httpMethod: "GET", completionHandler: { (data : [String:Any]) in
            
        } ,failureHandler :{ (error) in
            
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    @IBAction func loginWithCoinyTapped(_ sender: Any) {
        
        Coiny.login(presentingViewController: self, delegate: self)
    }
    
    //MARK -- CoinyLoginViewDelegate
    
    func coinyDidLoggedIn() {
        
    }
    
    func coinyLoginDidFail(error: Error?) {
        
    }
    func coinyLoginDidGetToken(authToken: String) {
        
    }
    
}

