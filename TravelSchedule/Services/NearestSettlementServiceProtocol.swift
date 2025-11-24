//
//  NearestSettlementServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.11.2025.
//

typealias NearestCityResponse = Components.Schemas.NearestCityResponse

protocol NearestSettlementServiceProtocol {
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestCityResponse
}
