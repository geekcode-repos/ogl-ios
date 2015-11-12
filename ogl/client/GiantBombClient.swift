//
//  Client.swift
//  ogl
//
//  Created by David on 10/31/15.
//  Copyright © 2015 GeekCode. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public class GiantBombClient {
    
    public let API_SCHEME:String = "http"
    public let API_HOST:String = "www.giantbomb.com"
    public let API_PATH:String = "api"
    public let API_FORMAT:String = "json"
    public let API_KEY:String = "9f6ca45384beec4b52072c4e7a601ccc6015464f"
    
    public func getGames(query: String) -> Observable<AnyObject!> {
        
        let endpoint = "games"
        var params = Dictionary<String, String>()
        params.updateValue("field:\(query)", forKey: "filter")
        return getURLSessionTask(endpoint, params: params)
    }
    
    private func getURLSessionTask(endpoint: String, params:Dictionary<String, String>) -> Observable<AnyObject!> {
        
        var urlString:String = "\(API_SCHEME)://\(API_HOST)/\(API_PATH)/\(endpoint)?format=\(API_FORMAT)&api_key=\(API_KEY)"
        
        for (key, value) in params {
            urlString = urlString.stringByAppendingString("&\(key)=\(value)")
        }
        
        print(urlString)
        let request = NSURLRequest(URL: NSURL(string: urlString)!)
        
        return NSURLSession.sharedSession().rx_JSON(request)
    }
    
    
}