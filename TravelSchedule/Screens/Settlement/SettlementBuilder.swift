//
//  SettlementBuilder.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI
import OpenAPIURLSession

final class SettlementBuilder {
    @MainActor 
    func build(direction: Route.Direction) -> SettlementView? {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                configuration: .init(dateTranscoder: ISO8601Coder()),
                transport: URLSessionTransport()
            )
            
            let service = TimetableService(client: client, apiKey: Auth.apiKey)
            let context = SettlementViewModel(direction: direction, service: service)
            return SettlementView(context: context)
        } catch {
            print(error.localizedDescription)
            return nil
        }

    }
}
