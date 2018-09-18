//
//  Networking.swift
//  IceBucket
//
//  Created by Rose Maina on 13/09/2018.
//  Copyright © 2018 Rose Maina. All rights reserved.
//

import Foundation

enum IceBucketError: Error {
    case InvalidUrl
    case NoData
    case MissingUrl
}

enum HTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

class Networking {
  
    let baseURL = URL(string: "https://bucketlist-api1.herokuapp.com/")
    let preferences = UserDefaults.standard
    
    func getBucketList() {
    
//    completion: @escaping (_ data: Any?) -> ()
        let session = URLSession(configuration: .default)
        
        let relativeURL = URL(string: "/bucketlist", relativeTo: baseURL)
        let url = URLComponents(url: relativeURL!, resolvingAgainstBaseURL: true)?.url
       let token = preferences.object(forKey: "token") as! String

        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        
        let task = session.dataTask(with: request) { (data, res, err) in
            if let error = err {
                print("Something went wrong", error)
                return
            }
            do {
                let formattedData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                
                print("yay we have data", formattedData!)
            } catch {
                print("Failed to decode data")
            }
        }
        task.resume()
    }
    
//    func login() {
//
//        let session = URLSession(configuration: .default)
//
//        let relativeURL = URL(string: "/auth/login", relativeTo: baseURL)
//        let url = URLComponents(url: relativeURL!, resolvingAgainstBaseURL: true)?.url
//
//        var request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
////        request.setValue(token, forHTTPHeaderField: "Authorization")
//
//
//        let task = session.dataTask(with: request) { (data, res, err) in
//            if let error = err {
//                print("Something went wrong", error)
//                return
//            }
//            print(data!)
////            do {
////                let formattedData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
////
////                print("yay we have data", formattedData)
////            } catch {
////                print("Failed to decode data")
////            }
//        }
//        task.resume()
//    }
}

