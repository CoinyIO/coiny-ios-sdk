//
//  CoinyLoginViewController.swift
//  CoinySDK
//
//  Created by KEMAL KOCABIYIK on 12.07.2018.
//  Copyright © 2018 KEMAL KOCABIYIK. All rights reserved.
//

import Foundation
import UIKit

public class CoinyLoginViewController : UIViewController , UIWebViewDelegate{
    
    private var webView : UIWebView!;
    
    private var appId : String!
    private var appSecret : String!
    private var authToken : String! {
        didSet{
            self.getToken()
        }
    }
    weak var delegate : CoinyLoginViewDelegate?
    
    public init(){
        self.appId = UserDefaults.standard.value(forKey: CoinyConstants.appId) as? String
        self.appSecret = UserDefaults.standard.value(forKey: CoinyConstants.appSecret) as? String
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        self.setupInterface()
    }
    
    private func setupInterface(){
        self.webView = UIWebView(frame: self.view.bounds)
        self.view.addSubview(webView)
        
        let url = "\(String(describing: UserDefaults.standard.value(forKey:CoinyConstants.url)!))oauth2/\(String(describing: appId!))/login?secret=\(appSecret.encodeURIComponent()!)"
        
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest(url: URL(string: url)!))
        
        let barButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(done))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    
    @objc func done() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let auth_token = request.url?.queryParameters?.first( where : { $0.key == "auth_token" } )
        
        if(auth_token != nil){
            self.authToken = auth_token?.value
            print("Logged In")
            return false;
        }
        return true
    }
    
    private func getToken(){
        let urlString = "\(String(describing: UserDefaults.standard.value(forKey:CoinyConstants.url)!))applications/\(String(describing: appId!))/token"
        
        guard let url = URL(string: urlString) else { return }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try! JSONSerialization.data(withJSONObject: ["authCode" : self.authToken! , "applicationId" : appId! , "applicationSecret" : appSecret], options: [])
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let data = data {
                    let items :[String:String] =  try! JSONSerialization.jsonObject(with: data, options : []) as! [String : String]
                    if(items["status"]! == "Ok"){
                        UserDefaults.standard.set(items["data"]!, forKey: CoinyConstants.accessToken)
                        self.delegate?.coinyDidLoggedIn()
                        self.done()
                    }else{
                        self.delegate?.coinyLoginDidFail(error: error)
                    }
                }
            }
        }
        task.resume()
    }
}

public protocol CoinyLoginViewDelegate : AnyObject {
    func coinyDidLoggedIn() -> Void;
    func coinyLoginDidFail(error : Error?) -> Void;
}
