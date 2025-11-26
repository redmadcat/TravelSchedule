//
//  ISO8601DateTranscoder.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 26.11.2025.
//

import Foundation
import OpenAPIRuntime

struct ISO8601DateTranscoder: DateTranscoder {
    /// Creates and returns an ISO 8601 formatted string representation of the specified date.
    public func encode(_ date: Date) throws -> String { ISO8601DateFormatter().string(from: date) }

    /// Creates and returns a date object from the specified ISO 8601 formatted string representation.
    public func decode(_ dateString: String) throws -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFractionalSeconds]
        guard let date = formatter.date(from: dateString) else {
            throw DecodingError.dataCorrupted(
                .init(codingPath: [], debugDescription: "Expected date string to be ISO8601-formatted.")
            )
        }
        return date
    }
}
