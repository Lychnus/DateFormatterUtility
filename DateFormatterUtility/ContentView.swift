//
//  ContentView.swift
//  DateFormatterUtility
//
//  Created by Tahir Anil Oghan on 29.07.2025.
//

import SwiftUI

// MARK: - Helpers
enum ContentViewLocalization: String, CaseIterable, Identifiable {
    case Current
    case America
    case Turkiye
    
    var id: String { self.rawValue }
    
    var locale: Locale {
        switch self {
            case .Current: .current
            case .America: .init(identifier: "en_US")
            case .Turkiye: .init(identifier: "tr_TR")
        }
    }
    
    var calendar: Calendar {
        switch self {
            case .Current: Calendar.current
            case .America: Calendar(identifier: .gregorian)
            case .Turkiye: Calendar(identifier: .gregorian)
        }
    }
    
    var calendarLocale: Locale {
        switch self {
            case .Current: .current
            case .America: .init(identifier: "en_US")
            case .Turkiye: .init(identifier: "tr_TR")
        }
    }
    
    var calendarTimezone: TimeZone {
        switch self {
            case .Current: .current
            case .America: TimeZone(identifier: "America/New_York")!
            case .Turkiye: TimeZone(identifier: "Europe/Istanbul")!
        }
    }
    
    var timezone: TimeZone {
        switch self {
            case .Current: .current
            case .America: TimeZone(identifier: "America/New_York")!
            case .Turkiye: TimeZone(identifier: "Europe/Istanbul")!
        }
    }
}

// MARK: - Implementation
struct ContentView {
    private let now = Date()
    private let past = Date().addingTimeInterval(-3600 * 24 * 3) // 3 days ago
    private let future = Date().addingTimeInterval(3600 * 5 + 60 * 45) // in 5h 45m
    private let formatter = FormatterTools.timeFormatter
    
    @State private var localizationOption: ContentViewLocalization = .Current
}

// MARK: - View
extension ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section("Localization") {
                    Picker("Select", selection: $localizationOption) {
                        ForEach(ContentViewLocalization.allCases) { localization in
                            Text(localization.rawValue).tag(localization)
                        }
                    }
                }
                
                Section("Standard Date Format") {
                    Text(formatter.formatDate(now, with: .common(dayPattern: .medium, hourPattern: .short, localization: .custom(locale: localizationOption.locale, calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone, timezone: localizationOption.timezone))))
                }

                Section("Template Format") {
                    Text(formatter.formatDate(now, with: .template("yMMMMdjm", localization: .custom(locale: localizationOption.locale, calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone, timezone: localizationOption.timezone))))
                }
                
                Section("Relative Format") {
                    Text("Past: \(formatter.formatRelativeDate(past, relativeTo: now, with: .common(datePattern: .named, unitPattern: .full, localization: .custom(locale: localizationOption.locale, calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone))))")
                    Text("Future: \(formatter.formatRelativeDate(future, relativeTo: now, with: .common(datePattern: .numeric, unitPattern: .abbreviated, localization: .custom(locale: localizationOption.locale, calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone))))")
                }

                Section("Interval Format") {
                    Text(formatter.formatDateInterval(from: past, to: future, with: .common(dayPattern: .medium, hourPattern: .short, localization: .custom(locale: localizationOption.locale, calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone, timezone: localizationOption.timezone))))
                }

                Section("Duration Format") {
                    let duration: TimeInterval = future.timeIntervalSince(now)
                    Text(formatter.formatDuration(duration: duration, with: .common(
                        allowedUnits: [.hour, .minute, .second],
                        unitsStyle: .full,
                        zeroBehavior: .dropAll,
                        maxUnitCount: 2,
                        allowFraction: false,
                        approximate: false,
                        timeRemaining: false,
                        collapseLargest: true,
                        localization: .custom(calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.timezone)
                    )))
                }

                Section("ISO8601 Format") {
                    Text(formatter.formatISO8601(now, with: .common(
                        options: [.withInternetDateTime, .withFractionalSeconds],
                        localization: .custom(timezone: localizationOption.timezone)
                    )))
                }
                
                Section("Component Extraction") {
                    Text("Year: \(formatter.extract(.numeric(.year, localization: .custom(calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone)), fromDate: now))")
                    Text("Weekday: \(formatter.extract(.textual(.weekdayName, localization: .custom(calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone)), fromDate: now))")
                    Text("Month Symbol: \(formatter.extract(.textual(.monthName, localization: .custom(calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone)), fromDate: now))")
                    Text("Hour24: \(formatter.extract(.numeric(.hour24, localization: .custom(calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone)), fromDate: now))")
                    Text("AM/PM: \(formatter.extract(.textual(.timeSymbol, localization: .custom(calendar: localizationOption.calendar, calendarLocale: localizationOption.calendarLocale, calendarTimezone: localizationOption.calendarTimezone)), fromDate: now))")
                }
            }
            .navigationTitle("TimeFormatter Demo")
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
