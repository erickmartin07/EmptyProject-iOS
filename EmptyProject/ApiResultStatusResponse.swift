//
//  GenericResponse.swift
//
//
//  Created by Erick Martin on 9/9/16.
//
//

import Foundation
import ObjectMapper

class ApiResultStatusResponse {
    var status = false
    var message = "Failed with unknown reason"
    
    func toApiResultStatus() -> ApiResultStatus {
        let apiResultStatus = ApiResultStatus()
        apiResultStatus.success = status
        apiResultStatus.message = message
        return apiResultStatus
    }
}

class ApiResultStatusDataResponse: Mappable {
    var apiResultStatusResponse = ApiResultStatusResponse()
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        apiResultStatusResponse.message <- map["message"]
    }
    
    func toApiResultStatusDataResponse() -> ApiResultStatusResponse {
        return apiResultStatusResponse
    }
}
