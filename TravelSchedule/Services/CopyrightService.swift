//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.11.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class CopyrightService: BaseService, CopyrightServiceProtocol {
    // MARK: - CopyrightServiceProtocol
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init(apikey: apikey))
        return try response.ok.body.json
    }
}
