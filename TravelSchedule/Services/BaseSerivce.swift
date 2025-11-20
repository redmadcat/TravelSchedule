//
//  BaseSerivce.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

class BaseSerivce {
    private(set) var client: Client
    private(set) var apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
}
