//
//  ApiClientManager.swift
//  ServerCommunicationManager
//
//  Created by Pawan Ahire on 4/2/18.
//  Copyright © 2018 ISS. All rights reserved.
//

import UIKit

// Completion Handler for the APICalling.
typealias CompletionHandler = (_ succss : Bool, _ errorMsg : String?, _ apiResponse : Any?) -> Void
typealias ProgressBarHandler = (_ progressValue : Float) -> Void


protocol modelDelegate {
    func updateUI(_ percentage: String, strokeEnd : CGFloat)
}

/**
 Description : - This is the signlton class, Specifically all the Webservice / ApiCalls in project are redirected through these class only, Basically we say that its class which is responsible for application API Calling.
 
 ### Important Notes ###
   SignleTon Class - Only One instance of that class will be created per application.
 
 - Requires: Knowledge of Singleton class concept.
 
 - Author: Pawan Ahire
 */

class ApiClientManager: NSObject, URLSessionDownloadDelegate {
    
    var delegate: modelDelegate?
    
    let urlString = "https://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4"
    
    /// This variable create singleinstance of the class.
    private static let sharedInstance : ApiClientManager = ApiClientManager()

    /**
     Description : - Initialzer method
     - Parameter  param-name : abc
     
     ### Important Notes ###
     As this is is the singleton class we need to keep init method private.
     */
    private override init() {
        
    }
    
    /**
     Description : - This method basically works as the getter method for the for sharedInstance.
     
     - Requires: Knowledge of how static variable/methods works.
     
     - Author: Pawan Ahire
     
     - Returns: SharedInstace of APIClientManager class.
     */
   public static func shared() -> ApiClientManager{
        return sharedInstance
    }

    public func beginDownloadingFile() {
        print("Attempting to download file")
        
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        
        guard let url = URL(string: urlString) else { return }
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        //print(totalBytesWritten, totalBytesExpectedToWrite)
        
        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        delegate?.updateUI("\(Int(percentage * 100))%", strokeEnd: percentage)
        print(percentage)
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Finished downloading file")
    }
    
}
