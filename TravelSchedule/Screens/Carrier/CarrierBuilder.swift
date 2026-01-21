//
//  CarrierBuilder.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 09.01.2026.
//

import SwiftUI
import OpenAPIURLSession

final class CarrierBuilder {
    func build(route: Route) -> CarrierView {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            configuration: .init(dateTranscoder: ISO8601Coder()),
            transport: URLSessionTransport()
        )
        
        let service = TimetableService(client: client, apiKey: Auth.apiKey)
        let filter = CarrierFilter()
        let context = CarrierViewModel(route: route, filter: filter, service: service)
        return CarrierView(context: context)
    }
}
