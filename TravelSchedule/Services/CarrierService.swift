//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.11.2025.
//

class CarrierService: BaseService, CarrierServiceProtocol {
    // MARK: - CarrierServiceProtocol
    func getCarrierInfo(code: String) async throws -> CarrierResponse {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code
        ))
        return try response.ok.body.json
    }
}
