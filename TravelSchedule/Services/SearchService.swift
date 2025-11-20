//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

final class SearchService: BaseSerivce, SearchServiceProtocol {
    override init(client: Client, apikey: String) {
        super.init(client: client, apikey: apikey)
    }
    
    // MARK: - SearchServiceProtocol
    func search(from: String, to: String, date: String) async throws -> Segments {
        let response = try await client.getSchedualBetweenStations(query: .init(
            apikey: apikey,
            from: from,
            to: to,
            date: date
        ))
        return try response.ok.body.json
    }
}
