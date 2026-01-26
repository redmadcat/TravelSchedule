//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

final class SearchService: SearchServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    // MARK: - SearchServiceProtocol
    func search(from: String, to: String, date: String?, transfers: Bool? = true) async throws -> [Segment] {            
        let response = try await client.getSchedualBetweenStations(query: .init(
            apikey: apiKey,
            from: from,
            to: to,
            date: date,
            transfers: transfers
        ))
                
        let result = try response.ok.body.json
        return result.segments ?? []
    }
}
