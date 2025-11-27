//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

final class SearchService: BaseService, SearchServiceProtocol {
    // MARK: - SearchServiceProtocol
    func search(from: String, to: String) async throws -> Segments {
        let response = try await client.getSchedualBetweenStations(query: .init(
            apikey: apiKey,
            from: from,
            to: to
        ))
        return try response.ok.body.json
    }
}
