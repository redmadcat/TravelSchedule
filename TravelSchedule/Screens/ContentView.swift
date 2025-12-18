//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.11.2025.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    @State private var router = Router.shared
    let title = "Settlements"
    
    var body: some View {
        NavigationStack(path: $router.endpoint) {
            TabView() {
                ScheduleBuilder().build()
                .tabItem {
                    Image("Schedule")
                        .renderingMode(.template)
                }
                SettingsView()
                .tabItem {
                    Image("Settings")
                        .renderingMode(.template)
                }
            }
            .navigationDestination(for: RouteEndpoint.self) { endpoint in
                switch endpoint {
                case .city:
                    RouteListView()
                        .navigationTitle(title)
                case .station:
                    RouteListView()
                }
            }
        }
        .tint(.ypBlackAD)
        .onAppear {
//            testTimetableService()
        }
    }
    
    func testTimetableService() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    configuration: .init(dateTranscoder: ISO8601Coder()),
                    transport: URLSessionTransport()
                )
                let timetableService = TimetableService(client: client, apiKey: Auth.apiKey)
                
                let nearestStations = try await timetableService.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
                print("Successfully fetched stations:\n\(nearestStations)")

                let search = try await timetableService.search(from: "c146", to: "c213")
                print("Successfully fetched search:\n\(search)")
                
                let schedule = try await timetableService.getStationSchedule(station: "s9600213")
                print("Successfully fetched schedule:\n\(schedule)")

                let thread = try await timetableService.getRouteStations(uid: "DP-6913_251202_c9144_12")
                print("Successfully fetched thread:\n\(thread)")
                
                let nearestCity = try await timetableService.getNearestCity(lat: 59.864177, lng: 30.319163)
                print("Successfully fetched city:\n\(nearestCity)")
                
                let carrier = try await timetableService.getCarrierInfo(code: "63438")
                print("Successfully fetched carrier:\n\(carrier)")
                
                let allStations = try await timetableService.getAllStations().countries?.count
                print("Successfully fetched allStations count:\n\(String(describing: allStations))")
                                                                
                let copyright = try await timetableService.getCopyright()
                print("Successfully fetched copyright:\n\(copyright)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
