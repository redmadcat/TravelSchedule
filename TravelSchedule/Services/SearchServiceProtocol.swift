//
//  SearchServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

typealias Segments = Components.Schemas.Segments

protocol SearchServiceProtocol {
    func search(from: String, to: String, date: String?) async throws -> Segments
}
