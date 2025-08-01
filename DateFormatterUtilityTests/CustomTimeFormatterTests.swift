//
//  CustomTimeFormatterTests.swift
//  DateFormatterUtilityTests
//
//  Created by Tahir Anil Oghan on 29.07.2025.
//

import Foundation
import Testing
@testable import DateFormatterUtility

@Suite("CustomTimeFormatterTests Tests")
struct CustomTimeFormatterTests {

    // - MARK: TimeFormatterDateStyle Tests
    
    @Test("TimeFormatterDateStyleLocalization returns correct descriptions.")
    func testTimeFormatterDateStyleLocalizationDescriptions() {
        let locale: Locale = .init(identifier: "en_US")
        let calendar: Calendar = .init(identifier: .gregorian)
        let calendarLocale: Locale = .init(identifier: "en_US")
        let calendarTimezone: TimeZone = .init(identifier: "America/New_York")!
        let timezone: TimeZone = .init(identifier: "America/New_York")!
        
        #expect(
            TimeFormatterDateStyle.TimeFormatterDateStyleLocalization.current.description
            == "current"
        )
        #expect(
            TimeFormatterDateStyle.TimeFormatterDateStyleLocalization.translated(locale: locale).description
            == "translated:en_US"
        )
        #expect(
            TimeFormatterDateStyle.TimeFormatterDateStyleLocalization.updating.description
            == "updating"
        )
        #expect(
            TimeFormatterDateStyle.TimeFormatterDateStyleLocalization.custom(
                locale: locale,
                calendar: calendar,
                calendarLocale: calendarLocale,
                calendarTimezone: calendarTimezone,
                timezone: timezone
            ).description
            == "custom:en_US:gregorian:en_US:America/New_York:America/New_York"
        )
    }
    
    @Test("TimeFormatterDateStyle returns correct descriptions.")
    func testTimeFormatterDateStyleDescriptions() {
        #expect(
            TimeFormatterDateStyle.common(dayPattern: .full, hourPattern: .full, localization: .current).description
            == "TimeFormatterDateStyle:common:4:4:current"
        )
        #expect(
            TimeFormatterDateStyle.template("yMMMdjm", localization: .current).description
            == "TimeFormatterDateStyle:template:<yMMMdjm>:current"
        )
        #expect(
            TimeFormatterDateStyle.custom("yyyy-MM-dd HH:mm", localization: .current).description
            == "TimeFormatterDateStyle:custom:<yyyy-MM-dd HH:mm>:current"
        )
    }
    
    // MARK: - TimeFormatterRelativeStyle Tests
    
    @Test("TimeFormatterRelativeStyleLocalization returns correct descriptions.")
    func testTimeFormatterRelativeStyleLocalizationDescriptions() {
        let locale: Locale = .init(identifier: "en_US")
        let calendar: Calendar = .init(identifier: .gregorian)
        let calendarLocale: Locale = .init(identifier: "en_US")
        let calendarTimezone: TimeZone = .init(identifier: "America/New_York")!
        
        #expect(
            TimeFormatterRelativeStyle.TimeFormatterRelativeStyleLocalization.current.description
            == "current"
        )
        #expect(
            TimeFormatterRelativeStyle.TimeFormatterRelativeStyleLocalization.translated(locale: locale).description
            == "translated:en_US"
        )
        #expect(
            TimeFormatterRelativeStyle.TimeFormatterRelativeStyleLocalization.updating.description
            == "updating"
        )
        #expect(
            TimeFormatterRelativeStyle.TimeFormatterRelativeStyleLocalization.custom(
                locale: locale,
                calendar: calendar,
                calendarLocale: calendarLocale,
                calendarTimezone: calendarTimezone
            ).description
            == "custom:en_US:gregorian:en_US:America/New_York"
        )
    }
    
    @Test("TimeFormatterRelativeStyle returns correct descriptions.")
    func testTimeFormatterRelativeStyleDescriptions() {
        #expect(
            TimeFormatterRelativeStyle.common(datePattern: .numeric, unitPattern: .full, localization: .current).description
            == "TimeFormatterRelativeStyle:common:0:0:current"
        )
    }
    
    // MARK: - TimeFormatterIntervalStyle Tests

    @Test("TimeFormatterIntervalStyleLocalization returns correct descriptions.")
    func testTimeFormatterIntervalStyleLocalizationDescriptions() {
        let locale: Locale = .init(identifier: "en_US")
        let calendar: Calendar = .init(identifier: .gregorian)
        let calendarLocale: Locale = .init(identifier: "en_US")
        let calendarTimezone: TimeZone = .init(identifier: "America/New_York")!
        let timezone: TimeZone = .init(identifier: "America/New_York")!
        
        #expect(
            TimeFormatterIntervalStyle.TimeFormatterIntervalStyleLocalization.current.description
            == "current"
        )
        #expect(
            TimeFormatterIntervalStyle.TimeFormatterIntervalStyleLocalization.translated(locale: locale).description
            == "translated:en_US"
        )
        #expect(
            TimeFormatterIntervalStyle.TimeFormatterIntervalStyleLocalization.updating.description
            == "updating"
        )
        #expect(
            TimeFormatterIntervalStyle.TimeFormatterIntervalStyleLocalization.custom(
                locale: locale,
                calendar: calendar,
                calendarLocale: calendarLocale,
                calendarTimezone: calendarTimezone,
                timezone: timezone
            ).description
            == "custom:en_US:gregorian:en_US:America/New_York:America/New_York"
        )
    }
    
    @Test("TimeFormatterIntervalStyle returns correct descriptions.")
    func testTimeFormatterIntervalStyleDescriptions() {
        #expect(
            TimeFormatterIntervalStyle.common(dayPattern: .full, hourPattern: .full, localization: .current).description
            == "TimeFormatterIntervalStyle:common:4:4:current"
        )
        #expect(
            TimeFormatterIntervalStyle.template("yMMMdjm", localization: .current).description
            == "TimeFormatterIntervalStyle:template:<yMMMdjm>:current"
        )
    }
    
    // MARK: - TimeFormatterDurationStyle Tests
    
    @Test("TimeFormatterDurationStyleLocalization returns correct descriptions.")
    func testTimeFormatterDurationStyleLocalizationDescriptions() {
        let calendar: Calendar = .init(identifier: .gregorian)
        let calendarLocale: Locale = .init(identifier: "en_US")
        let calendarTimezone: TimeZone = .init(identifier: "America/New_York")!
        
        #expect(
            TimeFormatterDurationStyle.TimeFormatterDurationStyleLocalization.current.description
            == "current"
        )
        #expect(
            TimeFormatterDurationStyle.TimeFormatterDurationStyleLocalization.updating.description
            == "updating"
        )
        #expect(
            TimeFormatterDurationStyle.TimeFormatterDurationStyleLocalization.custom(
                calendar: calendar,
                calendarLocale: calendarLocale,
                calendarTimezone: calendarTimezone,
            ).description
            == "custom:gregorian:en_US:America/New_York"
        )
    }
    
    @Test("TimeFormatterDurationStyle returns correct descriptions.")
    func testTimeFormatterDurationStyleDescriptions() {
        #expect(
            TimeFormatterDurationStyle.common(
                allowedUnits: [.month, .day],
                unitsStyle: .full,
                zeroBehavior: .default,
                maxUnitCount: 0,
                allowFraction: true,
                approximate: true,
                timeRemaining: true,
                collapseLargest: true,
                localization: .current
            ).description
            == "TimeFormatterDurationStyle:common:24:3:1:0:true:true:true:true:current"
        )
    }
    
    // MARK: - TimeFormatterISO8601Style Tests
    
    @Test("TimeFormatterISO8601StyleLocalization returns correct descriptions.")
    func testTimeFormatterISO8601StyleLocalizationDescriptions() {
        let timezone: TimeZone = .init(identifier: "America/New_York")!
        
        #expect(
            TimeFormatterISO8601Style.TimeFormatterISO8601StyleLocalization.current.description
            == "current"
        )
        #expect(
            TimeFormatterISO8601Style.TimeFormatterISO8601StyleLocalization.updating.description
            == "updating"
        )
        #expect(
            TimeFormatterISO8601Style.TimeFormatterISO8601StyleLocalization.custom(timezone: timezone).description
            == "custom:America/New_York"
        )
    }
    
    @Test("TimeFormatterISO8601Style returns correct descriptions.")
    func testTimeFormatterISO8601StyleDescriptions() {
        #expect(
            TimeFormatterISO8601Style.common(
                options: [.withFullDate, .withFullTime],
                localization: .current
            ).description
            == "TimeFormatterISO8601Style:common:1907:current"
        )
    }
    
    // MARK: - TimeFormatterDateComponent Tests
    
    @Test("TimeFormatterDateComponentLocalization returns correct descriptions.")
    func testTimeFormatterDateComponentLocalizationDescriptions() {
        let calendar: Calendar = .init(identifier: .gregorian)
        let calendarLocale: Locale = .init(identifier: "en_US")
        let calendarTimezone: TimeZone = .init(identifier: "America/New_York")!
        
        #expect(
            TimeFormatterDateComponent.TimeFormatterDateComponentLocalization.current.description
            == "current"
        )
        #expect(
            TimeFormatterDateComponent.TimeFormatterDateComponentLocalization.custom(
                calendar: calendar,
                calendarLocale: calendarLocale,
                calendarTimezone: calendarTimezone
            ).description
            == "custom:gregorian:en_US:America/New_York"
        )
    }
    
    @Test("TimeFormatterDateComponent returns correct descriptions.")
    func testTimeFormatterDateComponentDescriptions() {
        #expect(
            TimeFormatterDateComponent.numeric(.era, localization: .current).description
            == "TimeFormatterDateComponent:numeric:era:current"
        )
        #expect(
            TimeFormatterDateComponent.textual(.eraName, localization: .current).description
            == "TimeFormatterDateComponent:textual:eraName:current"
        )
    }
    
    // MARK: - CustomTimeFormatter Tests
    
    // MARK: - Date Formatting
    
    @Test("FormatDate produces localized date string is valid.")
    func testFormatDate() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterDateStyle.TimeFormatterDateStyleLocalization.custom(
            locale: .init(identifier: "en_US"),
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!,
            timezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let style = TimeFormatterDateStyle.common(dayPattern: .medium, hourPattern: .short, localization: localization)
        let result = mock.formatDate(testDate, with: style)
        
        #expect(result.contains("2023") || result.contains("Sep"))
    }
    
    @Test("FormatDate using template is valid.")
    func testFormatDateTemplatePattern() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterDateStyle.TimeFormatterDateStyleLocalization.custom(
            locale: .init(identifier: "en_US"),
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!,
            timezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let style = TimeFormatterDateStyle.template("yMMMdjm", localization: localization)
        let result = mock.formatDate(testDate, with: style)
        
        #expect(result.contains("2023") || result.contains("Sep"))
    }
    
    // MARK: - Relative Date Formatting
    
    @Test("FormatRelativeDate returns correct relative string is valid.")
    func testFormatRelativeDate() {
        let mock = CustomTimeFormatter.mock()
        let localization = TimeFormatterRelativeStyle.TimeFormatterRelativeStyleLocalization.custom(
            locale: .init(identifier: "en_US"),
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        
        let ref = Date()
        let past = ref.addingTimeInterval(-3600)
        let style = TimeFormatterRelativeStyle.common(datePattern: .named, unitPattern: .abbreviated, localization: localization)
        let result = mock.formatRelativeDate(past, relativeTo: ref, with: style)
        
        #expect(result.contains("ago"))
    }
    
    @Test("FormatRelativeDate handles future is valid.")
    func testFormatRelativeDateInFuture() {
        let mock = CustomTimeFormatter.mock()
        let localization = TimeFormatterRelativeStyle.TimeFormatterRelativeStyleLocalization.custom(
            locale: .init(identifier: "en_US"),
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        
        let ref = Date()
        let future = ref.addingTimeInterval(7200)
        let style = TimeFormatterRelativeStyle.common(datePattern: .numeric, unitPattern: .full, localization: localization)
        let result = mock.formatRelativeDate(future, relativeTo: ref, with: style)
        
        #expect(result.contains("in"))
    }
    
    // MARK: - Interval Formatting
    
    @Test("FormatDateInterval returns formatted interval is valid.")
    func testFormatDateInterval() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let mock = CustomTimeFormatter.mock()
        
        let style = TimeFormatterIntervalStyle.common(dayPattern: .short, hourPattern: .short, localization: .current)
        let result = mock.formatDateInterval(from: testDate, to: testDate + 3600, with: style)
        
        #expect(result.contains("–"))
    }
    
    @Test("FormatDateInterval using template is valid.")
    func testFormatIntervalTemplate() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let mock = CustomTimeFormatter.mock()
        
        let style = TimeFormatterIntervalStyle.template("jm", localization: .current)
        let result = mock.formatDateInterval(from: testDate, to: testDate + 7200, with: style)
        
        #expect(result.contains("–") || result.contains(":"))
    }
    
    // MARK: - Duration Formatting
    
    @Test("FormatDuration returns readable duration string is valid.")
    func testFormatDuration() {
        let mock = CustomTimeFormatter.mock()
        let localization = TimeFormatterDurationStyle.TimeFormatterDurationStyleLocalization.custom(
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        
        let style = TimeFormatterDurationStyle.common(
            allowedUnits: [.hour, .minute],
            unitsStyle: .abbreviated,
            zeroBehavior: .dropAll,
            maxUnitCount: 2,
            allowFraction: false,
            approximate: false,
            timeRemaining: false,
            collapseLargest: false,
            localization: localization
        )
        let result = mock.formatDuration(duration: 3660, with: style)
        
        #expect(result.contains("h") || result.contains("m"))
    }
    
    @Test("FormatDuration with fraction is valid.")
    func testFormatDurationWithFraction() {
        let mock = CustomTimeFormatter.mock()
        let localization = TimeFormatterDurationStyle.TimeFormatterDurationStyleLocalization.custom(
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        
        let style = TimeFormatterDurationStyle.common(
            allowedUnits: [.hour],
            unitsStyle: .full,
            zeroBehavior: .dropAll,
            maxUnitCount: 1,
            allowFraction: true,
            approximate: false,
            timeRemaining: false,
            collapseLargest: false,
            localization: localization
        )
        let result = mock.formatDuration(duration: 5400, with: style)
        
        #expect(result.contains("1.5") || result.contains("hour"))
    }
    
    // MARK: - ISO8601
    
    @Test("FormatISO8601 default is valid.")
    func testFormatISO8601() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterISO8601Style.TimeFormatterISO8601StyleLocalization.custom(
            timezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let style = TimeFormatterISO8601Style.common(options: [.withInternetDateTime], localization: localization)
        let result = mock.formatISO8601(testDate, with: style)
        
        #expect(result.contains("T") && result.contains(":"))
    }
    
    @Test("FormatISO8601 with custom time zone is valid.")
    func testFormatISO8601WithCustomTZ() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterISO8601Style.TimeFormatterISO8601StyleLocalization.custom(
            timezone: .init(identifier: "Asia/Tokyo")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let style = TimeFormatterISO8601Style.common(options: [.withFullDate, .withTimeZone], localization: localization)
        let result = mock.formatISO8601(testDate, with: style)
        
        #expect(result.contains("+0900"))
    }
    
    // MARK: - Numeric Extraction
    
    @Test("Extract numeric year is correct.")
    func testExtractNumericYear() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterDateComponent.TimeFormatterDateComponentLocalization.custom(
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let component = TimeFormatterDateComponent.numeric(.year, localization: localization)
        let result = mock.extract(component, fromDate: testDate)
        
        #expect(result == "2023")
    }
    
    @Test("Extract day of year is valid.")
    func testExtractDayOfYear() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterDateComponent.TimeFormatterDateComponentLocalization.custom(
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let component = TimeFormatterDateComponent.numeric(.dayOfYear, localization: localization)
        let result = mock.extract(component, fromDate: testDate)
        
        #expect(result == "272")
    }
    
    // MARK: - Textual Extraction
    
    @Test("Extract full month name is correct.")
    func testExtractTextualMonth() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterDateComponent.TimeFormatterDateComponentLocalization.custom(
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let component = TimeFormatterDateComponent.textual(.monthName, localization: localization)
        let result = mock.extract(component, fromDate: testDate)
        
        #expect(result == "September")
    }
    
    @Test("Extract short weekday symbol is correct.")
    func testExtractShortWeekday() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterDateComponent.TimeFormatterDateComponentLocalization.custom(
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let component = TimeFormatterDateComponent.textual(.shortWeekdayName, localization: localization)
        let result = mock.extract(component, fromDate: testDate)
        
        #expect(result == "Fri")
    }
    
    @Test("Extract very short weekday symbol is correct.")
    func testExtractVeryShortWeekdayName() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterDateComponent.TimeFormatterDateComponentLocalization.custom(
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let component = TimeFormatterDateComponent.textual(.veryShortWeekdayName, localization: localization)
        let result = mock.extract(component, fromDate: testDate)
        
        #expect(result == "F")
    }
    
    @Test("Extract AM/PM symbol is correct.")
    func testExtractTimeSymbol() {
        let testDate = Date(timeIntervalSince1970: 1_696_000_000) // 2023-09-01T00:00:00Z
        let localization = TimeFormatterDateComponent.TimeFormatterDateComponentLocalization.custom(
            calendar: .init(identifier: .gregorian),
            calendarLocale: .init(identifier: "en_US"),
            calendarTimezone: .init(identifier: "America/New_York")!
        )
        let mock = CustomTimeFormatter.mock()
        
        let component = TimeFormatterDateComponent.textual(.timeSymbol, localization: localization)
        let result = mock.extract(component, fromDate: testDate)
        
        #expect(result == "AM")
    }
}
