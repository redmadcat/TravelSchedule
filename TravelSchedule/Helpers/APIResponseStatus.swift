//
//  APIResponseStatus.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 06.01.2026.
//

enum APIResponseStatus {
    case `default`
    case loading
    case success
    case failure(ErrorType)
}
