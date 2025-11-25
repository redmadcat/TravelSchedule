//
//  StationsService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 25.11.2025.
//

import Foundation

class StationsService: BaseSerivce, StationsServiceProtocol {
    func getAllStations() async throws -> AllStationsResponse {
        let response = try await client.getAllStations(query: .init(apikey: apikey))
        
        let responseBody = try response.ok.body.text_html_charset_utf_hyphen_8
        
        let limit = 50 * 1024 * 1024
        let fullData = try await Data(collecting: responseBody, upTo: limit)
    
        let allStations = try JSONDecoder().decode(AllStationsResponse.self, from: fullData)
        return allStations
    }
}
