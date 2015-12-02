//
//  RestApiManager.swift
//  AnalyticsDashboard
//
//  Created by Taylor Martin on 11/24/15.
//  Copyright © 2015 Taylor Martin. All rights reserved.
//

import Foundation
import SwiftyJSON

class RestApiManager: NSObject {
    
    static let sharedInstance = RestApiManager()
    
    let baseURL = "https://api.twitter.com"
    
    func requestBearerToken() {
        
        let route = "\(baseURL)/oauth2/token"
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: NSURL(string: route)!)
        request.HTTPMethod = "POST"
        
        let authString = "4nrdpj0zxN7X2iJChOfBA9uHn:Y044sbiKlwiQXEHe2YiGIG3Zd8n7G61OlLN0F8fBr3RjVjg6qP"
        let encodedString = (authString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        let base64String = encodedString!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        let bodyDataString = "grant_type=client_credentials"
        let requestBodyData = (bodyDataString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        request.HTTPBody = requestBodyData
        
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Body: \(strData)")
            
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    print(jsonResult)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
            }
            
        })
        
        task.resume()
    }
    
}