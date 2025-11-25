//
//  CarrierServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.11.2025.
//

typealias CarrierResponse = Components.Schemas.CarrierResponse

protocol CarrierServiceProtocol {
    func getCarrierInfo(code: String, system: String?) async throws -> CarrierResponse
}
