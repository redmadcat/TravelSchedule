//
//  StationsService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 25.11.2025.
//

import Foundation

final class StationsService: StationsServiceProtocol {
    let client: Client
    let apiKey: String
    private let country = "Россия"
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getAllStations() async throws -> [Settlement] {
        let response = try await client.getAllStations(query: .init(apikey: apiKey))
        
        let responseBody = try response.ok.body.text_html_charset_utf_hyphen_8
        
        let limit = 50 * 1024 * 1024
        let fullData = try await Data(collecting: responseBody, upTo: limit)
    
        let allStations = try JSONDecoder().decode(AllStationsResponse.self, from: fullData)
                
        if let result = allStations.countries?.filter({ $0.title == country }).first {
            if let regions = result.regions {
                // Fetched most appropriate regions for test purpose
                if let regionMsk = regions[37].settlements, let regionSpb = regions[53].settlements {
                    return regionMsk + regionSpb
                        .filter {
                            guard let title = $0.title else { return false }
                            return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        }
                }
            }
        }
        
        return []
    }
}
