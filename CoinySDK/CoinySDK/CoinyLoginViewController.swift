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
    
    weak var delegate : CoinyLoginViewDelegate?
    
    public init(){
        self.appId = UserDefaults.standard.value(forKey: CoinyConstants.appId) as? String
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
        
        let redirectUrl = URLSchemeUtilities.externalURLScheme()! + "://success"
        let urlString = "\(String(describing: UserDefaults.standard.value(forKey:CoinyConstants.oauthUrl)!))oauth_signin?client_id=\(String(describing: appId!))&redirect_uri=\(String(describing: redirectUrl))"
        
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest(url: URL(string: urlString)!))
        
        let barButtonItem = UIBarButtonItem(title: "Kapat", style: .done, target: self, action: #selector(done))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    
    @objc func done() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        let auth_token = request.url?.queryParameters?.first( where : { $0.key == "auth_token" } )

        if(auth_token != nil){
            self.delegate?.coinyLoginDidGetToken(authToken: (auth_token?.value.removingPercentEncoding)!)
        }
        return true
    }
}

public protocol CoinyLoginViewDelegate : AnyObject {
    func coinyDidLoggedIn() -> Void;
    func coinyLoginDidFail(error : Error?) -> Void;
    func coinyLoginDidGetToken(authToken : String) -> Void;
}
