//
//  DogAPI_Helper.swift
//  A2_WebServices
//
//  Created by Shivam Bajaj on 2023-02-01.
//

import Foundation
import UIKit
struct DogAPIHelper{
    
    private static let baseURL : String = "https://dog.ceo/api/breeds/list"

    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    static func fetchdog(callback: @escaping ([String]) -> Void){
        guard
            let url = URL(string: baseURL)
        else{return}
        var newArray = [String]()
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    guard
                        let jsonDictionary = jsonObject as? [AnyHashable: Any],
                        let dogType = jsonDictionary["message"] as? [String]
                    else {preconditionFailure("could not parse JSOn data")}
                    
                    for i in 0..<dogType.count {
                       let item = dogType[i]
                        newArray.append(item)
                    }
                    OperationQueue.main.addOperation {
                        callback(newArray)
                    }
                } catch let e {
                    print("error \(e)")
                }
            } else if let error = error {
                print("there was an error: \(error)")
            } else {
                print("something went wrong")
            }
        }
        task.resume()
    }
 
