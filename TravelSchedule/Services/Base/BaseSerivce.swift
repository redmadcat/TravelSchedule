//
//  BaseSerivce.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

class BaseService {
    private(set) var client: Client
    private(set) var apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
}
