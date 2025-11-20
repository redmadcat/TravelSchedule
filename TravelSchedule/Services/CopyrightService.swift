//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.11.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class CopyrightService: BaseSerivce, CopyrightServiceProtocol {
    override init(client: Client, apikey: String) {
        super.init(client: client, apikey: apikey)
    }
        
    // MARK: - CopyrightServiceProtocol
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init(apikey: apikey))
        return try response.ok.body.json
    }
}
