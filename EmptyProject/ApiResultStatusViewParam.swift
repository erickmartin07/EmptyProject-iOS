//
//  StatusViewParam.swift
//
//
//  Created by Erick Martin on 9/9/16.
//
//

import Foundation

class ApiResultStatusViewParam {
    
    var success = false
    var message = "Failed with unknown reason"
    
    static func create(apiResultStatus: ApiResultStatus) -> ApiResultStatusViewParam {
        let apiResultStatusViewParam = ApiResultStatusViewParam()
        
        apiResultStatusViewParam.success = apiResultStatus.success
        apiResultStatusViewParam.message = apiResultStatus.message
        
        return apiResultStatusViewParam
    }
    
}
