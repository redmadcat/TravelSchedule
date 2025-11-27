//
//  CopyrightServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.11.2025.
//

typealias Copyright = Components.Schemas.Copyright

protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> Copyright
}
