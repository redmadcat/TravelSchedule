//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.11.2025.
//

final class CarrierService: BaseService, CarrierServiceProtocol {
    // MARK: - CarrierServiceProtocol
    func getCarrierInfo(code: String) async throws -> CarrierResponse {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apiKey,
            code: code
        ))
        return try response.ok.body.json
    }
}
