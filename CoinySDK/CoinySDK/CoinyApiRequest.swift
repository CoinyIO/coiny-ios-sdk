//
//  CoinyApiRequest.swift
//  CoinySDK
//
//  Created by KEMAL KOCABIYIK on 12.07.2018.
//  Copyright © 2018 KEMAL KOCABIYIK. All rights reserved.
//

import Foundation

public typealias CompletionHandler<T> = (_ data: T) -> Void
public typealias FailureHandler = (_ error : Error) -> Void

public class CoinyApiRequest {
    
    
    public static func createRequest<TResponse>(path : String ,
                                                         parameters : [String:Any]?,
                                                         httpMethod : String,
                                                         completionHandler: @escaping CompletionHandler<TResponse> ,
                                                         failureHandler : @escaping FailureHandler){
        
        let request = self.createUrlRequest(path : path, httpMethod: httpMethod, parameters: parameters)
        if let params = parameters{
            request.httpBody = try! JSONSerialization.data(withJSONObject: params , options: [])
        }
        self.sendTask(urlRequest: request as URLRequest, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    public static func createRequest<TResponse: Codable>(path : String ,
                                                         parameters : [String:Any]?,
                                                         httpMethod : String,
                                                         completionHandler: @escaping CompletionHandler<TResponse> ,
                                                         failureHandler : @escaping FailureHandler){
    
        let request = self.createUrlRequest(path : path, httpMethod: httpMethod, parameters: parameters)
        if let params = parameters{
            request.httpBody = try! JSONSerialization.data(withJSONObject: params , options: [])
        }
        self.sendTask(urlRequest: request as URLRequest, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    public static func createRequest<TRequest: Codable, TResponse: Codable>(path : String ,
                                                                            parameters : TRequest?,
                                                                            httpMethod : String,
                                                                            completionHandler: @escaping CompletionHandler<TResponse> ,
                                                                            failureHandler : @escaping FailureHandler){
        
        self.createRequest(path: path, parameters: parameters.dictionary, httpMethod: httpMethod, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    
    
    private static func createUrlRequest(path : String, httpMethod: String , parameters : Any!) -> NSMutableURLRequest{
        
        let urlString = "\(String(describing: UserDefaults.standard.value(forKey:CoinyConstants.apiUrl)!))\(path)"
        let url = URL(string: urlString)!
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = httpMethod
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = UserDefaults.standard.value(forKey: CoinyConstants.accessToken) {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization" )
        }

        return request;
    }
    
    private static func sendTask<TResponse : Codable>(urlRequest: URLRequest, completionHandler: @escaping CompletionHandler<TResponse> ,  failureHandler : @escaping FailureHandler){
        
        URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            if error != nil {
                print(error!.localizedDescription)
                failureHandler(error!)
            } else {
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                    let decodedObject = try! decoder.decode(TResponse.self, from: data)
                    completionHandler(decodedObject)
                }
            }
            }.resume()
    }
    
    private static func sendTask<TResponse : Any>(urlRequest: URLRequest, completionHandler: @escaping CompletionHandler<TResponse> ,  failureHandler : @escaping FailureHandler){
        
        URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            if error != nil {
                print(error!.localizedDescription)
                failureHandler(error!)
            } else {
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                    let decodedObject = try! JSONSerialization.jsonObject(with: data, options: []) as! TResponse
                    completionHandler(decodedObject)
                }
            }
            }.resume()
    }
    
    
}
