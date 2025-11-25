//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.11.2025.
//

class CarrierService: BaseSerivce, CarrierServiceProtocol {
    // MARK: - CarrierServiceProtocol
    func getCarrierInfo(code: String, system: String?) async throws -> CarrierResponse {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code,
            system: system
        ))
        return try response.ok.body.json
    }
}
