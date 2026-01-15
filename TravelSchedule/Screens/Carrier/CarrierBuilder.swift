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
        let context = CarrierViewModel(service: service)
        let filter = CarrierFilter()
        return CarrierView(context: context, filter: filter, route: route)
    }
}
