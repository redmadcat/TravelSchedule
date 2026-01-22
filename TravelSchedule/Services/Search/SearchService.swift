//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

final class SearchService: SearchServiceProtocol {
    let client: Client
    let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    // MARK: - SearchServiceProtocol
    func search(from: String, to: String) async throws -> [Segment] {
        var segments: [Segment] = []
        let response = try await client.getSchedualBetweenStations(query: .init(
            apikey: apiKey,
            from: from,
            to: to
        ))
                
        let result = try response.ok.body.json
        
        for segment in result.segments ?? [] {
            let result = MockDataConverter.convert(segment: segment)
            segments.append(result)
        }
            
        return segments
    }
}
