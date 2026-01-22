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
        var settlements: [Settlement] = []
        let response = try await client.getAllStations(query: .init(apikey: apiKey))
        let responseBody = try response.ok.body.text_html_charset_utf_hyphen_8
        
        let limit = 50 * 1024 * 1024
        let fullData = try await Data(collecting: responseBody, upTo: limit)
    
        let stationsResponse = try JSONDecoder().decode(AllStationsResponse.self, from: fullData)
                            
        guard let result = stationsResponse.countries?.filter({ $0.title == country }).first else { return [] }
        if let regions = result.regions {
            for region in regions {
                if let regionSettlements = region.settlements {
                    settlements += regionSettlements
                }
            }
        }
        
        return settlements.filter {
            guard let title = $0.title else { return false }
            return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
        .sorted {
            guard let title1 = $0.title, let title2 = $1.title else { return false }
            return title1 < title2
        }
    }
}
