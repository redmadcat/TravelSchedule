//
//  SearchServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

typealias Segments = Components.Schemas.Segments

protocol SearchServiceProtocol: Sendable {
    func search(from: String, to: String, date: String?, transfers: Bool?) async throws -> [Segment]
}
