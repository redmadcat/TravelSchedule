//
//  SettlementBuilder.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI
import OpenAPIURLSession

final class SettlementBuilder {
    func build() -> SettlementView {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            configuration: .init(dateTranscoder: ISO8601Coder()),
            transport: URLSessionTransport()
        )
        
        let router = Router.shared
        let service = TimetableService(client: client, apiKey: Auth.apiKey)
        let context = SettlementViewModel(router: router, service: service)
        return SettlementView(context: context)
    }
}
