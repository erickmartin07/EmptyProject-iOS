//
//
//
//  Created by Erick Martin on 9/9/16.
//
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

protocol ApiClientProtocol {
    func postString(path: String, headers: [String: String], params: [String: Any]) -> Observable<(Bool, String)>
}

class ApiClient: ApiClientProtocol {
    
    private let hostProduction = "https://www.xxx.com/api/v1/"
    private let hostStaging = "https://staging.xxx.com/api/v1/"
    
    private var host: String
    private static let successResponseCode = 200
    private static let sessionExpiredResponseCode = 401
    
    init(useProduction: Bool = true) {
        host = useProduction ? hostProduction : hostStaging
    }
    
    func postString(path: String, headers: [String: String], params: [String: Any]) -> Observable<(Bool, String)> {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let manager = SessionManager.default
        return manager.rx.request(.post, createURL(path: path), parameters: params, headers: populateHeaders(dict: headers))
            .flatMap { alamofireRequest in
                alamofireRequest.rx.responseString()
            }
            .do(onNext: { (response, string) in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                },
                onError: { _ in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                },
                onCompleted: {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                })
            .map { (response, string) in
                return (response.statusCode == ApiClient.successResponseCode, string)
        }
    }

    private func createURL(path: String) -> String {
        return host + path
    }
    
    private func populateHeaders(
        dict: [String:String]? = nil) -> [String:String] {
        var headers = [String:String]()
        headers["API-KEY"] = "17d32457220C136fA34bA83964d493Be"
        headers["PLATFORM"] = "iOS"
        headers["USER-TYPE"] = "client"

        if let dict = dict {
            for (k, v) in dict where !k.isEmpty {
                headers[k] = v
            }
        }
        
        return headers
    }
    
}
