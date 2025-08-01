//
//  CustomTimeFormatter.swift
//  DateFormatterUtility
//
//  Created by Tahir Anil Oghan on 29.07.2025.
//

import Foundation

// MARK: - Protocol
/// Provides functionality for formatting time values into string representations using predefined or custom styles.
public protocol TimeFormatter {
    
    /// Formats the given `Date` using a predefined date and time style.
    ///
    /// - Parameters:
    ///   - date: The `Date` value to be formatted.
    ///   - style: The formatting style to apply.
    /// - Returns: A formatted string representation of the date.
    func formatDate(_ date: Date, with style: TimeFormatterDateStyle) -> String

    /// Formats a `Date` as a relative time string compared to another reference date.
    ///
    /// - Parameters:
    ///   - date: The date to be formatted (e.g., `Date.now - 3600`).
    ///   - relativeTo: The reference point to compare against (e.g., `Date.now`).
    ///   - style: The relative formatting style to apply.
    /// - Returns: A localized string such as `"1 hour ago"` or `"in 2 days"`.
    func formatRelativeDate(_ date: Date, relativeTo: Date, with style: TimeFormatterRelativeStyle) -> String

    /// Formats the duration between two dates using a predefined interval style.
    ///
    /// - Parameters:
    ///   - fromDate: The start date of the interval.
    ///   - toDate: The end date of the interval.
    ///   - style: The interval formatting style to apply.
    /// - Returns: A string representation such as `"Aug 1 – Aug 4"` or `"3:00 PM – 4:00 PM"`.
    func formatDateInterval(from fromDate: Date, to toDate: Date, with style: TimeFormatterIntervalStyle) -> String

    /// Formats a duration value (in seconds) using a component-based style.
    ///
    /// - Parameters:
    ///   - duration: The time interval in seconds (e.g., `3661` for 1h 1m 1s).
    ///   - style: The duration formatting style to apply.
    /// - Returns: A string such as `"1h 1m 1s"` or `"61 minutes"`, depending on the style.
    func formatDuration(duration: TimeInterval, with style: TimeFormatterDurationStyle) -> String

    /// Formats a `Date` using the ISO 8601 standard.
    ///
    /// - Parameters:
    ///   - date: The `Date` value to be formatted.
    ///   - style: The ISO 8601 formatting variant to apply.
    /// - Returns: A string such as `"2025-07-29T14:30:00Z"` depending on the style.
    func formatISO8601(_ date: Date, with style: TimeFormatterISO8601Style) -> String

    /// Extracts a specific component from the given `Date`.
    ///
    /// - Parameters:
    ///   - component: The date/time component to extract.
    ///   - date: The date from which to extract.
    /// - Returns: A string representation of the component (e.g., `"Tuesday"`, `"14"`, `"PM"`).
    func extract(_ component: TimeFormatterDateComponent, fromDate date: Date) -> String
}

// MARK: - Protocol Extension (Convenience Overloads)
extension TimeFormatter {
    
    /// Formats the given `Epoch` time value in milliseconds into a string representation.
    ///
    /// - Parameters:
    ///   - epoch: The time value in milliseconds since 1970. Typealias `Double`.
    ///   - style: The desired formatting style.
    /// - Returns: A formatted string representation of the date.
    public func formatDate(fromEpoch epoch: TimeInterval, with style: TimeFormatterDateStyle) -> String {
        formatDate(Date(timeIntervalSince1970: epoch / 1000), with: style)
    }

    /// Formats the given `Unix` time value in seconds into a string representation.
    ///
    /// - Parameters:
    ///   - unix: The time value in seconds since 1970. Typealias `Double`.
    ///   - style: The desired formatting style.
    /// - Returns: A formatted string representation of the date.
    public func formatDate(fromUnix unix: TimeInterval, with style: TimeFormatterDateStyle) -> String {
        formatDate(Date(timeIntervalSince1970: unix), with: style)
    }

    /// Formats the given `Epoch` time value in milliseconds into a relative string representation.
    ///
    /// - Parameters:
    ///   - epoch: The time value in milliseconds since 1970. Typealias `Double`.
    ///   - relativeTo: The reference date to calculate relativity.
    ///   - style: The desired relative formatting style.
    /// - Returns: A localized string such as `"1 hour ago"` or `"in 2 days"`.
    public func formatRelativeDate(fromEpoch epoch: TimeInterval, relativeTo: Date, with style: TimeFormatterRelativeStyle) -> String {
        formatRelativeDate(Date(timeIntervalSince1970: epoch / 1000), relativeTo: relativeTo, with: style)
    }

    /// Formats the given `Unix` time value in seconds into a relative string representation.
    ///
    /// - Parameters:
    ///   - unix: The time value in seconds since 1970. Typealias `Double`.
    ///   - relativeTo: The reference date to calculate relativity.
    ///   - style: The desired relative formatting style.
    /// - Returns: A localized string such as `"1 hour ago"` or `"in 2 days"`.
    public func formatRelativeDate(fromUnix unix: TimeInterval, relativeTo: Date, with style: TimeFormatterRelativeStyle) -> String {
        formatRelativeDate(Date(timeIntervalSince1970: unix), relativeTo: relativeTo, with: style)
    }

    /// Formats the interval between two `Epoch` time values in milliseconds.
    ///
    /// - Parameters:
    ///   - from: The starting time in milliseconds since 1970.
    ///   - to: The ending time in milliseconds since 1970.
    ///   - style: The desired interval formatting style.
    /// - Returns: A string representation such as `"Aug 1 – Aug 4"` or `"3:00 PM – 4:00 PM"`.
    public func formatDateInterval(fromEpoch from: TimeInterval, toEpoch to: TimeInterval, with style: TimeFormatterIntervalStyle) -> String {
        formatDateInterval(from: Date(timeIntervalSince1970: from / 1000), to: Date(timeIntervalSince1970: to / 1000), with: style)
    }

    /// Formats the interval between two `Unix` time values in seconds.
    ///
    /// - Parameters:
    ///   - from: The starting time in seconds since 1970.
    ///   - to: The ending time in seconds since 1970.
    ///   - style: The desired interval formatting style.
    /// - Returns: A string representation such as `"Aug 1 – Aug 4"` or `"3:00 PM – 4:00 PM"`.
    public func formatDateInterval(fromUnix from: TimeInterval, toUnix to: TimeInterval, with style: TimeFormatterIntervalStyle) -> String {
        formatDateInterval(from: Date(timeIntervalSince1970: from), to: Date(timeIntervalSince1970: to), with: style)
    }

    /// Formats the given `Epoch` time value in milliseconds into an ISO8601 string representation.
    ///
    /// - Parameters:
    ///   - epoch: The time value in milliseconds since 1970. Typealias `Double`.
    ///   - style: The desired ISO8601 formatting style.
    /// - Returns: A string such as `"2025-07-29T14:30:00Z"` depending on the style.
    public func formatISO8601(fromEpoch epoch: TimeInterval, with style: TimeFormatterISO8601Style) -> String {
        formatISO8601(Date(timeIntervalSince1970: epoch / 1000), with: style)
    }

    /// Formats the given `Unix` time value in seconds into an ISO8601 string representation.
    ///
    /// - Parameters:
    ///   - unix: The time value in seconds since 1970. Typealias `Double`.
    ///   - style: The desired ISO8601 formatting style.
    /// - Returns: A string such as `"2025-07-29T14:30:00Z"` depending on the style.
    public func formatISO8601(fromUnix unix: TimeInterval, with style: TimeFormatterISO8601Style) -> String {
        formatISO8601(Date(timeIntervalSince1970: unix), with: style)
    }

    /// Extracts a specific component from the given `Epoch` time value in milliseconds.
    ///
    /// - Parameters:
    ///   - component: The date/time component to extract.
    ///   - epoch: The time value in milliseconds since 1970. Typealias `Double`.
    /// - Returns: A string representation of the component (e.g., `"Tuesday"`, `"14"`, `"PM"`).
    public func extract(_ component: TimeFormatterDateComponent, fromEpoch epoch: TimeInterval) -> String {
        extract(component, fromDate: Date(timeIntervalSince1970: epoch / 1000))
    }

    /// Extracts a specific component from the given `Unix` time value in seconds.
    ///
    /// - Parameters:
    ///   - component: The date/time component to extract.
    ///   - unix: The time value in seconds since 1970. Typealias `Double`.
    /// - Returns: A string representation of the component (e.g., `"Tuesday"`, `"14"`, `"PM"`).
    public func extract(_ component: TimeFormatterDateComponent, fromUnix unix: TimeInterval) -> String {
        extract(component, fromDate: Date(timeIntervalSince1970: unix))
    }
}

// MARK: - Helpers
/// This enum defines how to format a `Date` using `DateFormatter`, either with system styles, a localized template, or a fixed format string.
public enum TimeFormatterDateStyle {
    
    /// Represents different localization strategies.
    ///
    /// Use `.current` for system defaults,
    ///
    /// Use`.translated` to override only the locale for display,
    ///
    /// Use`.updating` for dynamically tracking environment changes (e.g., Settings app changes),
    ///
    /// Use `.custom` for full control over all formatting behaviors.
    public enum TimeFormatterDateStyleLocalization {
        
        /// Uses system's current settings for all localization fields.
        case current

        /// Applies a specific locale for output formatting, while using `.current` for calendar and timezone.
        ///
        /// - Parameters:
        ///   - locale: The `Locale` used for localizing textual representation.
        case translated(locale: Locale)

        /// Uses `.autoupdatingCurrent` for locale, calendar, and timezone to automatically reflect system changes.
        case updating

        /// Allows full customization of locale, calendar, and timezone behaviors.
        ///
        /// - Parameters:
        ///   - locale: The locale used for formatting output (e.g., "en_US").
        ///   - calendar: The calendar system used for date calculations (e.g., `.iso8601`).
        ///   - calendarLocale: The locale attached to the calendar (affects weekday symbols, start of week).
        ///   - calendarTimezone: The timezone attached to the calendar (affects component extraction).
        ///   - timezone: The output timezone used for rendering full date values.
        case custom(
            locale: Locale,
            calendar: Calendar,
            calendarLocale: Locale,
            calendarTimezone: TimeZone,
            timezone: TimeZone
        )
        
        /// Returns a short string identifier representing the localization strategy.
        internal var description: String {
            switch self {
                case .current: 
                    return "current"
                    
                case .translated(let locale):
                    return "translated:\(locale.identifier)"
                    
                case .updating:
                    return "updating"
                    
                case .custom(let locale, let calendar, let calendarLocale, let calendarTimezone, let timezone):
                    return "custom:\(locale.identifier):\(calendar.identifier):\(calendarLocale.identifier):\(calendarTimezone.identifier):\(timezone.identifier)"
            }
        }
    }
    
    /// Formats the date using system-provided date and time styles.
    ///
    /// - Parameters:
    ///   - dayPattern: The style to use for the date portion (e.g., `.short`, `.long`).
    ///   - hourPattern: The style to use for the time portion (e.g., `.none`, `.medium`).
    ///   - localization: Configuration for different localization strategies.
    case common(
        dayPattern: DateFormatter.Style,
        hourPattern: DateFormatter.Style,
        localization: TimeFormatterDateStyleLocalization
    )
    
    /// Formats the date using a custom localized date-time template string.
    ///
    /// - Parameters:
    ///   - pattern: A template string (e.g., `"yMMMdjm"`) interpreted based on the current locale.
    ///   - localization: Configuration for different localization strategies.
    case template(
        _ pattern: String,
        localization: TimeFormatterDateStyleLocalization
    )
    
    /// Formats the date using a fixed, non-localized format string.
    ///
    /// - Parameters:
    ///   - pattern: The exact format string to use (e.g., `"yyyy-MM-dd HH:mm"`).
    ///   - localization: Configuration for different localization strategies.
    case custom(
        _ pattern: String,
        localization: TimeFormatterDateStyleLocalization
    )
    
    /// Configures the provided `DateFormatter` based on the current style.
    ///
    /// - Parameters:
    ///   - formatter: The `DateFormatter` instance to configure.
    internal func configure(_ formatter: DateFormatter) {
        switch self {
            case .common(let dayPattern, let hourPattern, let localization):
                configureFormatterLocalization(formatter, with: localization)
                formatter.dateStyle = dayPattern
                formatter.timeStyle = hourPattern
                
            case .template(let pattern, let localization):
                configureFormatterLocalization(formatter, with: localization)
                formatter.setLocalizedDateFormatFromTemplate(pattern)
                
            case .custom(let pattern, let localization):
                configureFormatterLocalization(formatter, with: localization)
                formatter.dateFormat = pattern
        }
    }
    
    /// Configures formatter with given localization strategies.
    private func configureFormatterLocalization(_ formatter: DateFormatter, with localization: TimeFormatterDateStyleLocalization) {
        switch localization {
            case .current:
                formatter.locale = .current
                formatter.timeZone = .current
                var calendar = Calendar.current
                calendar.locale = .current
                calendar.timeZone = .current
                formatter.calendar = calendar
                
            case .translated(let locale):
                formatter.locale = locale
                formatter.timeZone = .current
                var calendar = Calendar.current
                calendar.locale = .current
                calendar.timeZone = .current
                formatter.calendar = calendar
                
            case .updating:
                formatter.locale = .autoupdatingCurrent
                formatter.timeZone = .autoupdatingCurrent
                var calendar = Calendar.autoupdatingCurrent
                calendar.locale = .autoupdatingCurrent
                calendar.timeZone = .autoupdatingCurrent
                formatter.calendar = calendar
                
            case .custom(let locale, let calendar, let calendarLocale, let calendarTimezone, let timezone):
                formatter.locale = locale
                formatter.timeZone = timezone
                var timetable = calendar
                timetable.locale = calendarLocale
                timetable.timeZone = calendarTimezone
                formatter.calendar = timetable
        }
    }
    
    /// Returns a short description representing the style type.
    internal var description: String {
        switch self {
            case .common(let dayPattern, let hourPattern, let localization):
                return "TimeFormatterDateStyle:common:\(dayPattern.rawValue):\(hourPattern.rawValue):\(localization.description)"
                
            case .template(let pattern, let localization):
                return "TimeFormatterDateStyle:template:<\(pattern)>:\(localization.description)"
                
            case .custom(let pattern, let localization):
                return "TimeFormatterDateStyle:custom:<\(pattern)>:\(localization.description)"
        }
    }
}

/// This enum defines how to format a `Date` relative to another reference date using `RelativeDateTimeFormatter`.
///
/// This includes options for phrasing (e.g., "yesterday" vs "1 day ago") and unit verbosity (e.g., "hours", "hr").
public enum TimeFormatterRelativeStyle {
    
    /// Represents different localization strategies.
    ///
    /// Use `.current` for system defaults,
    ///
    /// Use`.translated` to override only the locale for display,
    ///
    /// Use`.updating` for dynamically tracking environment changes (e.g., Settings app changes),
    ///
    /// Use `.custom` for full control over all formatting behaviors.
    public enum TimeFormatterRelativeStyleLocalization {
        
        /// Uses system's current settings for all localization fields.
        case current

        /// Applies a specific locale for output formatting, while using `.current` for calendar.
        ///
        /// - Parameters:
        ///   - locale: The `Locale` used for localizing textual representation.
        case translated(locale: Locale)

        /// Uses `.autoupdatingCurrent` for locale and calendar to automatically reflect system changes.
        case updating

        /// Allows full customization of locale, and calendar behaviors.
        ///
        /// - Parameters:
        ///   - locale: The locale used for formatting output (e.g., "en_US").
        ///   - calendar: The calendar system used for date calculations (e.g., `.iso8601`).
        ///   - calendarLocale: The locale attached to the calendar (affects weekday symbols, start of week).
        ///   - calendarTimezone: The timezone attached to the calendar (affects component extraction).
        case custom(
            locale: Locale,
            calendar: Calendar,
            calendarLocale: Locale,
            calendarTimezone: TimeZone
        )
        
        /// Returns a short string identifier representing the localization strategy.
        internal var description: String {
            switch self {
                case .current:
                    return "current"
                    
                case .translated(let locale):
                    return "translated:\(locale.identifier)"
                    
                case .updating:
                    return "updating"
                    
                case .custom(let locale, let calendar, let calendarLocale, let calendarTimezone):
                    return "custom:\(locale.identifier):\(calendar.identifier):\(calendarLocale.identifier):\(calendarTimezone.identifier)"
            }
        }
    }
    
    /// Represents a standard relative date format using configurable phrasing and unit styles.
    ///
    /// - Parameters:
    ///   - datePattern: The style to use for the date portion (e.g., `"yesterday"` vs `"1 day ago"`).
    ///   - unitPattern: The style to use for the time unit portion (e.g., `"hours"`, `"hr"`, `"h"`).
    ///   - localization: Configuration for different localization strategies.
    case common(
        datePattern: RelativeDateTimeFormatter.DateTimeStyle,
        unitPattern: RelativeDateTimeFormatter.UnitsStyle,
        localization: TimeFormatterRelativeStyleLocalization
    )

    /// Configures the provided `RelativeDateTimeFormatter` based on the current style.
    ///
    /// - Parameters:
    ///   - formatter: The `RelativeDateTimeFormatter` instance to configure.
    internal func configure(_ formatter: RelativeDateTimeFormatter) {
        switch self {
            case .common(let datePattern, let unitPattern, let localization):
                configureFormatterLocalization(formatter, with: localization)
                formatter.dateTimeStyle = datePattern
                formatter.unitsStyle = unitPattern
        }
    }
    
    /// Configures formatter with given localization strategies.
    private func configureFormatterLocalization(_ formatter: RelativeDateTimeFormatter, with localization: TimeFormatterRelativeStyleLocalization) {
        switch localization {
            case .current:
                formatter.locale = .current
                var calendar = Calendar.current
                calendar.locale = .current
                calendar.timeZone = .current
                formatter.calendar = calendar
                
            case .translated(let locale):
                formatter.locale = locale
                var calendar = Calendar.current
                calendar.locale = .current
                calendar.timeZone = .current
                formatter.calendar = calendar
                
            case .updating:
                formatter.locale = .autoupdatingCurrent
                var calendar = Calendar.autoupdatingCurrent
                calendar.locale = .autoupdatingCurrent
                calendar.timeZone = .autoupdatingCurrent
                formatter.calendar = calendar
                
            case .custom(let locale, let calendar, let calendarLocale, let calendarTimezone):
                formatter.locale = locale
                var timetable = calendar
                timetable.locale = calendarLocale
                timetable.timeZone = calendarTimezone
                formatter.calendar = timetable
        }
    }
    
    /// Returns a short description representing the style type.
    internal var description: String {
        switch self {
            case .common(let datePattern, let unitPattern, let localization):
                return "TimeFormatterRelativeStyle:common:\(datePattern.rawValue):\(unitPattern.rawValue):\(localization.description)"
        }
    }
}

/// This enum defines how to format a date interval (e.g., start and end `Date`) using `DateIntervalFormatter`,
/// with support for either standard style configuration or a localized template string.
public enum TimeFormatterIntervalStyle {
    
    /// Represents different localization strategies.
    ///
    /// Use `.current` for system defaults,
    ///
    /// Use`.translated` to override only the locale for display,
    ///
    /// Use`.updating` for dynamically tracking environment changes (e.g., Settings app changes),
    ///
    /// Use `.custom` for full control over all formatting behaviors.
    public enum TimeFormatterIntervalStyleLocalization {
        
        /// Uses system's current settings for all localization fields.
        case current

        /// Applies a specific locale for output formatting, while using `.current` for calendar and timezone.
        ///
        /// - Parameters:
        ///   - locale: The `Locale` used for localizing textual representation.
        case translated(locale: Locale)

        /// Uses `.autoupdatingCurrent` for locale, calendar, and timezone to automatically reflect system changes.
        case updating

        /// Allows full customization of locale, calendar, and timezone behaviors.
        ///
        /// - Parameters:
        ///   - locale: The locale used for formatting output (e.g., "en_US").
        ///   - calendar: The calendar system used for date calculations (e.g., `.iso8601`).
        ///   - calendarLocale: The locale attached to the calendar (affects weekday symbols, start of week).
        ///   - calendarTimezone: The timezone attached to the calendar (affects component extraction).
        ///   - timezone: The output timezone used for rendering full date values.
        case custom(
            locale: Locale,
            calendar: Calendar,
            calendarLocale: Locale,
            calendarTimezone: TimeZone,
            timezone: TimeZone
        )
        
        /// Returns a short string identifier representing the localization strategy.
        internal var description: String {
            switch self {
                case .current:
                    return "current"
                    
                case .translated(let locale):
                    return "translated:\(locale.identifier)"
                    
                case .updating:
                    return "updating"
                    
                case .custom(let locale, let calendar, let calendarLocale, let calendarTimezone, let timezone):
                    return "custom:\(locale.identifier):\(calendar.identifier):\(calendarLocale.identifier):\(calendarTimezone.identifier):\(timezone.identifier)"
            }
        }
    }
    
    /// Represents a standard interval format using configurable date and time styles.
    ///
    /// - Parameters:
    ///   - dayPattern: The style used for the interval's date portion (e.g., `.short`, `.long`).
    ///   - hourPattern: The style used for the interval's time portion (e.g., `.short`, `.full`).
    ///   - localization: Configuration for different localization strategies.
    case common(
        dayPattern: DateIntervalFormatter.Style,
        hourPattern: DateIntervalFormatter.Style,
        localization: TimeFormatterIntervalStyleLocalization
    )
    
    /// Represents a custom localized interval format using a date template string.
    ///
    /// - Parameters:
    ///   - pattern: A date template string (e.g., `"yMMMdjm"`) interpreted based on the current locale.
    ///   - localization: Configuration for different localization strategies.
    case template(
        _ pattern: String,
        localization: TimeFormatterIntervalStyleLocalization
    )
    
    /// Configures the provided `DateIntervalFormatter` based on the current style.
    ///
    /// - Parameters:
    ///   - formatter: The `DateIntervalFormatter` instance to configure.
    internal func configure(_ formatter: DateIntervalFormatter) {
        switch self {
            case .common(let dayPattern, let hourPattern, let localization):
                configureFormatterLocalization(formatter, with: localization)
                formatter.dateStyle = dayPattern
                formatter.timeStyle = hourPattern
                
            case .template(let pattern, let localization):
                configureFormatterLocalization(formatter, with: localization)
                formatter.dateTemplate = pattern
        }
    }
    
    /// Configures formatter with given localization strategies.
    private func configureFormatterLocalization(_ formatter: DateIntervalFormatter, with localization: TimeFormatterIntervalStyleLocalization) {
        switch localization {
            case .current:
                formatter.locale = .current
                formatter.timeZone = .current
                var calendar = Calendar.current
                calendar.locale = .current
                calendar.timeZone = .current
                formatter.calendar = calendar
                
            case .translated(let locale):
                formatter.locale = locale
                formatter.timeZone = .current
                var calendar = Calendar.current
                calendar.locale = .current
                calendar.timeZone = .current
                formatter.calendar = calendar
                
            case .updating:
                formatter.locale = .autoupdatingCurrent
                formatter.timeZone = .autoupdatingCurrent
                var calendar = Calendar.autoupdatingCurrent
                calendar.locale = .autoupdatingCurrent
                calendar.timeZone = .autoupdatingCurrent
                formatter.calendar = calendar
                
            case .custom(let locale, let calendar, let calendarLocale, let calendarTimezone, let timezone):
                formatter.locale = locale
                formatter.timeZone = timezone
                var timetable = calendar
                timetable.locale = calendarLocale
                timetable.timeZone = calendarTimezone
                formatter.calendar = timetable
        }
    }
    
    /// Returns a short description representing the style type.
    internal var description: String {
        switch self {
            case .common(let dayPattern, let hourPattern, let localization): 
                return "TimeFormatterIntervalStyle:common:\(dayPattern.rawValue):\(hourPattern.rawValue):\(localization.description)"
                
            case .template(let pattern, let localization):
                return "TimeFormatterIntervalStyle:template:<\(pattern)>:\(localization.description)"
        }
    }
}

/// This enum defines how to format a time duration (e.g., `TimeInterval`) using `DateComponentsFormatter`,
public enum TimeFormatterDurationStyle {
    
    /// Represents different localization strategies.
    ///
    /// Use `.current` for system defaults,
    ///
    /// Use`.updating` for dynamically tracking environment changes (e.g., Settings app changes),
    ///
    /// Use `.custom` for full control over all formatting behaviors.
    public enum TimeFormatterDurationStyleLocalization {
        
        /// Uses system's current settings for calendar, calendar.locale and calendar.timeZone.
        case current

        /// Uses `.autoupdatingCurrent` for calendar, calendar.locale and calendar.timeZone to automatically reflect system changes.
        case updating

        /// Allows full customization of calendar, calendar.locale and calendar.timeZone behaviors.
        ///
        /// - Parameters:
        ///   - calendar: The calendar system used for date calculations (e.g., `.iso8601`).
        ///   - calendarLocale: The locale attached to the calendar (affects weekday symbols, start of week).
        ///   - calendarTimezone: The timezone attached to the calendar (affects component extraction).
        case custom(
            calendar: Calendar,
            calendarLocale: Locale,
            calendarTimezone: TimeZone
        )
        
        /// Returns a short string identifier representing the localization strategy.
        internal var description: String {
            switch self {
                case .current:
                    return "current"
                    
                case .updating:
                    return "updating"
                    
                case .custom(let calendar, let calendarLocale, let calendarTimezone):
                    return "custom:\(calendar.identifier):\(calendarLocale.identifier):\(calendarTimezone.identifier)"
            }
        }
    }
    
    /// A standard configuration for formatting durations using `DateComponentsFormatter`.
    ///
    /// Use this case to customize how a time interval (e.g., seconds, minutes, hours) is represented as a readable string.
    ///
    /// - Parameters:
    ///   - allowedUnits: Specifies which time units to include in the output (e.g., `.hour`, `.minute`, `.second`). You can combine multiple using bitmask (e.g., `[.hour, .minute]`).
    ///   - unitsStyle: Determines how time units are written (e.g., `.full` for `"1 hour"`, `.abbreviated` for `"1 hr"`, `.positional` for `"1:00"`).
    ///   - zeroBehavior: Defines how zero-value units are handled (e.g., omit or include them). Use options like `.dropAll`, `.pad`, or combinations.
    ///   - maxUnitCount: Limits the number of units shown in the output (e.g., `2` → `"1 hour, 30 minutes"`). If `0`, no limit is applied.
    ///   - allowFraction: If `true`, enables fractional formatting (e.g., `"1.5 hours"` instead of `"1 hour, 30 minutes"`).
    ///   - approximate: If `true`, prepends approximate terms (e.g., `"about 2 hours"`).
    ///   - timeRemaining: If `true`, adds a forward-looking phrase (e.g., `"2 hours remaining"`).
    ///   - collapseLargest: If `true`, allows collapsing larger units into smaller ones when needed (e.g., `"1 day, 25 hours"` → `"2 days, 1 hour"`).
    ///   - localization: Configuration for different localization strategies.
    case common(
        allowedUnits: NSCalendar.Unit,
        unitsStyle: DateComponentsFormatter.UnitsStyle,
        zeroBehavior: DateComponentsFormatter.ZeroFormattingBehavior,
        maxUnitCount: Int,
        allowFraction: Bool,
        approximate: Bool,
        timeRemaining: Bool,
        collapseLargest: Bool,
        localization: TimeFormatterDurationStyleLocalization
    )
    
    /// Configures the provided `DateComponentsFormatter` based on the current style.
    ///
    /// - Parameters:
    ///   - formatter: The `DateComponentsFormatter` instance to configure.
    internal func configure(_ formatter: DateComponentsFormatter) {
        switch self {
            case .common(
                let allowedUnits,
                let unitsStyle,
                let zeroBehavior,
                let maxUnitCount,
                let allowFraction,
                let approximate,
                let timeRemaining,
                let collapseLargest,
                let localization
            ):
                configureFormatterLocalization(formatter, with: localization)
                formatter.allowedUnits = allowedUnits
                formatter.unitsStyle = unitsStyle
                formatter.zeroFormattingBehavior = zeroBehavior
                formatter.maximumUnitCount = maxUnitCount
                formatter.allowsFractionalUnits = allowFraction
                formatter.includesApproximationPhrase = approximate
                formatter.includesTimeRemainingPhrase = timeRemaining
                formatter.collapsesLargestUnit = collapseLargest
        }
    }
    
    /// Configures formatter with given localization strategies.
    private func configureFormatterLocalization(_ formatter: DateComponentsFormatter, with localization: TimeFormatterDurationStyleLocalization) {
        switch localization {
            case .current:
                var calendar = Calendar.current
                calendar.locale = .current
                calendar.timeZone = .current
                formatter.calendar = calendar
                
            case .updating:
                var calendar = Calendar.autoupdatingCurrent
                calendar.locale = .autoupdatingCurrent
                calendar.timeZone = .autoupdatingCurrent
                formatter.calendar = calendar
                
            case .custom(let calendar, let calendarLocale, let calendarTimezone):
                var timetable = calendar
                timetable.locale = calendarLocale
                timetable.timeZone = calendarTimezone
                formatter.calendar = timetable
        }
    }
    
    /// Returns a short description representing the style type.
    internal var description: String {
        switch self {
            case .common(let allowedUnits, let unitsStyle, let zeroBehavior,
                         let maxUnitCount, let allowFraction, let approximate,
                         let timeRemaining, let collapseLargest, let localization):
                let key = [
                    "TimeFormatterDurationStyle",
                    "common",
                    "\(allowedUnits.rawValue)",
                    "\(unitsStyle.rawValue)",
                    "\(zeroBehavior.rawValue)",
                    "\(maxUnitCount)",
                    "\(allowFraction)",
                    "\(approximate)",
                    "\(timeRemaining)",
                    "\(collapseLargest)",
                    localization.description
                ]
                return key.joined(separator: ":")
        }
    }
}

/// This enum defines how to format a `Date` using `ISO8601DateFormatter`, supporting both standard and custom ISO formatting options.
public enum TimeFormatterISO8601Style {
    
    /// Represents different localization strategies.
    ///
    /// Use `.current` for system defaults,
    ///
    /// Use`.updating` for dynamically tracking environment changes (e.g., Settings app changes),
    ///
    /// Use `.custom` for full control over formatting behavior.
    public enum TimeFormatterISO8601StyleLocalization {
        
        /// Uses system's current setting for timezone.
        case current

        /// Uses `.autoupdatingCurrent` for timezone to automatically reflect system changes.
        case updating

        /// Allows full customization of timezone behaviors.
        ///
        /// - Parameters:
        ///   - timezone: The output timezone used for rendering full date values.
        case custom(timezone: TimeZone)
        
        /// Returns a short string identifier representing the localization strategy.
        internal var description: String {
            switch self {
                case .current:
                    return "current"
                    
                case .updating:
                    return "updating"
                    
                case .custom(let timezone):
                    return "custom:\(timezone.identifier)"
            }
        }
    }
    
    /// A standard ISO 8601 format configuration.
    ///
    /// - Parameters:
    ///   - options: The formatting options to use, such as including time, fractional seconds, or time zones.
    ///   - localization: Configuration for different localization strategies.
    case common(
        options: ISO8601DateFormatter.Options,
        localization: TimeFormatterISO8601StyleLocalization
    )
    
    /// Configures the provided `ISO8601DateFormatter` based on the current style.
    ///
    /// - Parameters:
    ///   - formatter: The `ISO8601DateFormatter` instance to configure.
    internal func configure(_ formatter: ISO8601DateFormatter) {
        switch self {
            case .common(let options, let localization):
                configureFormatterLocalization(formatter, with: localization)
                formatter.formatOptions = options
        }
    }
    
    /// Configures formatter with given localization strategies.
    private func configureFormatterLocalization(_ formatter: ISO8601DateFormatter, with localization: TimeFormatterISO8601StyleLocalization) {
        switch localization {
            case .current:
                formatter.timeZone = .current
                
            case .updating:
                formatter.timeZone = .autoupdatingCurrent
                
            case .custom(let timezone):
                formatter.timeZone = timezone
        }
    }
    
    /// Returns a short description representing the style type.
    internal var description: String {
        switch self {
            case .common(let options, let localization): return "TimeFormatterISO8601Style:common:\(options.rawValue):\(localization.description)"
        }
    }
}

/// Represents individual components that can be extracted from a `Date`, either numerically or as localized strings.
public enum TimeFormatterDateComponent {
    
    /// Represents different localization strategies.
    ///
    /// Use `.current` for system defaults,
    ///
    /// Use `.custom` for full control over all formatting behaviors.
    public enum TimeFormatterDateComponentLocalization {
        
        /// Uses system's current settings for calendar, calendar.locale and calendar.timeZone.
        case current

        /// Allows full customization of calendar, calendar.locale and calendar.timeZone behaviors.
        ///
        /// - Parameters:
        ///   - calendar: The calendar system used for date calculations (e.g., `.iso8601`).
        ///   - calendarLocale: The locale attached to the calendar (affects weekday symbols, start of week).
        ///   - calendarTimezone: The timezone attached to the calendar (affects component extraction).
        case custom(
            calendar: Calendar,
            calendarLocale: Locale,
            calendarTimezone: TimeZone
        )
        
        /// Returns a short string identifier representing the localization strategy.
        internal var description: String {
            switch self {
                case .current:
                    return "current"
                    
                case .custom(let calendar, let calendarLocale, let calendarTimezone):
                    return "custom:\(calendar.identifier):\(calendarLocale.identifier):\(calendarTimezone.identifier)"
            }
        }
    }
    
    /// Represents components that are numerically extracted from a `Date` using `Calendar.component(_:from:)`.
    public enum NumericComponent: String {
        
        /// The era value (e.g., `1` for "AD", `0` for "BC").
        case era
        
        /// The full numeric year (e.g., `2025`).
        case year
        
        /// The quarter of the year (e.g., `1` to `4`).
        case quarter
        
        /// The numeric month of the year (e.g., `7` for July).
        case month
        
        /// The ISO 8601 week of the year (e.g., `34`).
        case weekOfYear
        
        /// The week of the month (e.g., `2` for second week of the month).
        case weekOfMonth
        
        /// The weekday index according to the calendar (e.g., `1` for Sunday in Gregorian).
        case weekday
        
        /// The ordinal of the weekday in the current month (e.g., `2` for "second Tuesday").
        case weekdayOfMonth
        
        /// The numeric day of the month (e.g., `29`).
        case dayOfMonth
        
        /// The ordinal day in the year (e.g., `210` for July 29).
        case dayOfYear
        
        /// The hour in 12-hour format (e.g., `3` for 3 PM).
        case hour12
        
        /// The hour in 24-hour format (e.g., `15` for 3 PM).
        case hour24
        
        /// The minute component (e.g., `45`).
        case minute
        
        /// The second component (e.g., `12`).
        case second
        
        /// The millisecond component of a second (e.g., `532`).
        case milisecond
        
        /// The nanosecond component of a second (e.g., `430000000`).
        case nanosecond
        
        /// The current time zone as interpreted numerically (used for offset logic).
        case timeZone
    }
    
    /// Represents components that are extracted as localized strings using `DateFormatter` symbol arrays.
    public enum TextualComponent: String {
        
        /// The short era symbol (e.g., `"AD"`, `"BC"`).
        case eraSymbol
        
        /// The full era name (e.g., `"Anno Domini"`).
        case eraName
        
        /// The localized quarter name (e.g., `"1st quarter"`).
        case quarterName
        
        /// The short localized quarter symbol (e.g., `"Q1"`, `"Q2"`).
        case shortQuarterName
        
        /// The full localized month name (e.g., `"July"`, `"Temmuz"`).
        case monthName
        
        /// The abbreviated month name (e.g., `"Jul"`, `"Tem"`).
        case shortMonthName
        
        /// The very short month name (e.g., `"J"` for July).
        case veryShortMonthName
        
        /// The full localized weekday name (e.g., `"Tuesday"`, `"Salı"`).
        case weekdayName
        
        /// The abbreviated weekday name (e.g., `"Tue"`, `"Sal"`).
        case shortWeekdayName
        
        /// The very short weekday name (e.g., `"T"` for Tuesday).
        case veryShortWeekdayName
        
        /// The localized symbol for AM (e.g., `"AM"`, `"ÖÖ"`).
        case amSymbol
        
        /// The localized symbol for PM (e.g., `"PM"`, `"ÖS"`).
        case pmSymbol
        
        /// A generic localized time period symbol (AM/PM based on context).
        case timeSymbol
    }
    
    /// Components that are numerically extracted from a `Date`.
    ///
    /// - Parameters:
    ///   - localization: Configuration for different localization strategies.
    case numeric(_ component: NumericComponent, localization: TimeFormatterDateComponentLocalization)
    
    /// Components that are extracted as localized String from a `Date`.
    ///
    /// - Parameters:
    ///   - localization: Configuration for different localization strategies.
    case textual(_ component: TextualComponent, localization: TimeFormatterDateComponentLocalization)
    
    /// Configures `Calendar` instance based on component.
    ///
    /// - Returns: A configured `Calendar` instance.
    internal func calendar() -> Calendar {
        switch self {
            case .numeric(_, let localization), .textual(_, let localization):
                return configureCalendarLocalization(localization: localization)
        }
    }
    
    /// Configures calendar with given localization strategies.
    private func configureCalendarLocalization(localization: TimeFormatterDateComponentLocalization) -> Calendar {
        switch localization {
            case .current:
                var calendar = Calendar.current
                calendar.locale = .current
                calendar.timeZone = .current
                return calendar
                
            case .custom(let calendar, let calendarLocale, let calendarTimezone):
                var timetable = calendar
                timetable.locale = calendarLocale
                timetable.timeZone = calendarTimezone
                return timetable
        }
    }
    
    /// Returns a short description representing the component type.
    internal var description: String {
        switch self {
            case .numeric(let component, let localization):
                return "TimeFormatterDateComponent:numeric:\(component.rawValue):\(localization.description)"
                
            case .textual(let component, let localization):
                return "TimeFormatterDateComponent:textual:\(component.rawValue):\(localization.description)"
        }
    }
}

// MARK: - Implementation
/// Implementation of `TimeFormatter` that formats date and time values using predefined or custom styles.
///
/// This formatter supports ISO8601, relative (past/future/now), and custom date-time formats,
/// as well as extracting individual date components (e.g., weekday, era, hour).
/// It uses internal caching of `DateFormatter` instances for improved performance and enforces a singleton-based access pattern.
internal final class CustomTimeFormatter {
    
    /// Singleton instance.
    internal static let shared: CustomTimeFormatter = CustomTimeFormatter()
    
    /// Formatters caches for reusable configurations.
    private var dateStyleCache: NSCache<NSString, DateFormatter> = .init()
    private var relativeStyleCache: NSCache<NSString, RelativeDateTimeFormatter> = .init()
    private var intervalStyleCache: NSCache<NSString, DateIntervalFormatter> = .init()
    private var durationStyleCache: NSCache<NSString, DateComponentsFormatter> = .init()
    private var iSO8601StyleCache: NSCache<NSString, ISO8601DateFormatter> = .init()
    
    /// Secured initializer to enforce `.shared` usage.
    private init() { }
}

// MARK: - Private Methods
extension CustomTimeFormatter {
    
    /// Returns a cached or newly configured `DateFormatter` for the `TimeFormatterDateStyle`.
    ///
    /// - Parameters:
    ///   - style: The formatting style to apply.
    /// - Returns: A `DateFormatter` instance configured for the style.
    private func dateStyleFormatter(for style: TimeFormatterDateStyle) -> DateFormatter {
        let key = NSString(string: style.description)
        // If cached return it.
        if let cached = dateStyleCache.object(forKey: key) { return cached }
        
        let formatter = DateFormatter()
        style.configure(formatter)
        dateStyleCache.setObject(formatter, forKey: key)
        return formatter
    }
    
    /// Returns a cached or newly configured `RelativeDateTimeFormatter` for the `TimeFormatterRelativeStyle`.
    ///
    /// - Parameters:
    ///   - style: The formatting style to apply.
    /// - Returns: A `RelativeDateTimeFormatter` instance configured for the style.
    private func relativeStyleFormatter(for style: TimeFormatterRelativeStyle) -> RelativeDateTimeFormatter {
        let key = NSString(string: style.description)
        // If cached return it.
        if let cached = relativeStyleCache.object(forKey: key) { return cached }
        
        let formatter = RelativeDateTimeFormatter()
        style.configure(formatter)
        relativeStyleCache.setObject(formatter, forKey: key)
        return formatter
    }
    
    /// Returns a cached or newly configured `DateIntervalFormatter` for the `TimeFormatterIntervalStyle`.
    ///
    /// - Parameters:
    ///   - style: The formatting style to apply.
    /// - Returns: A `DateIntervalFormatter` instance configured for the style.
    private func intervalStyleFormatter(for style: TimeFormatterIntervalStyle) -> DateIntervalFormatter {
        let key = NSString(string: style.description)
        // If cached return it.
        if let cached = intervalStyleCache.object(forKey: key) { return cached }
        
        let formatter = DateIntervalFormatter()
        style.configure(formatter)
        intervalStyleCache.setObject(formatter, forKey: key)
        return formatter
    }
    
    /// Returns a cached or newly configured `DateComponentsFormatter` for the `TimeFormatterDurationStyle`.
    ///
    /// - Parameters:
    ///   - style: The formatting style to apply.
    /// - Returns: A `DateComponentsFormatter` instance configured for the style.
    private func durationStyleFormatter(for style: TimeFormatterDurationStyle) -> DateComponentsFormatter {
        let key = NSString(string: style.description)
        // If cached return it.
        if let cached = durationStyleCache.object(forKey: key) { return cached }
        
        let formatter = DateComponentsFormatter()
        style.configure(formatter)
        durationStyleCache.setObject(formatter, forKey: key)
        return formatter
    }
    
    /// Returns a cached or newly configured `ISO8601DateFormatter` for the `TimeFormatterISO8601Style`.
    ///
    /// - Parameters:
    ///   - style: The formatting style to apply.
    /// - Returns: A `ISO8601DateFormatter` instance configured for the style.
    private func iSO8601StyleFormatter(for style: TimeFormatterISO8601Style) -> ISO8601DateFormatter {
        let key = NSString(string: style.description)
        // If cached return it.
        if let cached = iSO8601StyleCache.object(forKey: key) { return cached }
        
        let formatter = ISO8601DateFormatter()
        style.configure(formatter)
        iSO8601StyleCache.setObject(formatter, forKey: key)
        return formatter
    }
}

// MARK: - Protocol Conformance
extension CustomTimeFormatter: TimeFormatter {
    
    func formatDate(_ date: Date, with style: TimeFormatterDateStyle) -> String {
        let formatter = dateStyleFormatter(for: style)
        return formatter.string(from: date)
    }

    func formatRelativeDate(_ date: Date, relativeTo: Date, with style: TimeFormatterRelativeStyle) -> String {
        let formatter = relativeStyleFormatter(for: style)
        return formatter.localizedString(for: date, relativeTo: relativeTo)
    }

    func formatDateInterval(from fromDate: Date, to toDate: Date, with style: TimeFormatterIntervalStyle) -> String {
        let formatter = intervalStyleFormatter(for: style)
        return formatter.string(from: fromDate, to: toDate)
    }

    func formatDuration(duration: TimeInterval, with style: TimeFormatterDurationStyle) -> String {
        let formatter = durationStyleFormatter(for: style)
        guard let result = formatter.string(from: duration) else { return "?" } // Not posssible format fallback.
        return result
    }

    func formatISO8601(_ date: Date, with style: TimeFormatterISO8601Style) -> String {
        let formatter = iSO8601StyleFormatter(for: style)
        return formatter.string(from: date)
    }

    func extract(_ component: TimeFormatterDateComponent, fromDate date: Date) -> String {
        let calendar: Calendar = component.calendar()
        
        switch component {
            case .numeric(let numericComponent, _):
                switch numericComponent {
                    case .era:
                        return String(calendar.component(.era, from: date))
                    case .year:
                        return String(calendar.component(.year, from: date))
                    case .quarter:
                        return String(calendar.component(.quarter, from: date))
                    case .month:
                        return String(calendar.component(.month, from: date))
                    case .weekOfYear:
                        return String(calendar.component(.weekOfYear, from: date))
                    case .weekOfMonth:
                        return String(calendar.component(.weekOfMonth, from: date))
                    case .weekday:
                        return String(calendar.component(.weekday, from: date))
                    case .weekdayOfMonth:
                        return String(calendar.component(.weekdayOrdinal, from: date))
                    case .dayOfMonth:
                        return String(calendar.component(.day, from: date))
                    case .dayOfYear:
                        return String(calendar.ordinality(of: .day, in: .year, for: date) ?? -1)
                    case .hour12:
                        let hour = calendar.component(.hour, from: date)
                        return String(hour == 0 ? 12 : hour % 12)
                    case .hour24:
                        return String(calendar.component(.hour, from: date))
                    case .minute:
                        return String(calendar.component(.minute, from: date))
                    case .second:
                        return String(calendar.component(.second, from: date))
                    case .milisecond:
                        let nanoseconds = calendar.component(.nanosecond, from: date)
                        return String(nanoseconds / 1_000_000)
                    case .nanosecond:
                        return String(calendar.component(.nanosecond, from: date))
                    case .timeZone:
                        let seconds = calendar.timeZone.secondsFromGMT(for: date)
                        return String(seconds)
                }
                
            case .textual(let textualComponent, _):
                let weekdayIndex = calendar.component(.weekday, from: date) - 1 // 1-based
                let monthIndex = calendar.component(.month, from: date) - 1 // 1-based
                
                switch textualComponent {
                    case .eraSymbol:
                        return calendar.eraSymbols[safe: calendar.component(.era, from: date)] ?? "?"
                    case .eraName:
                        return calendar.longEraSymbols[safe: calendar.component(.era, from: date)] ?? "?"
                    case .quarterName:
                        return calendar.quarterSymbols[safe: calendar.component(.quarter, from: date) - 1] ?? "?"
                    case .shortQuarterName:
                        return calendar.shortQuarterSymbols[safe: calendar.component(.quarter, from: date) - 1] ?? "?"
                    case .monthName:
                        return calendar.monthSymbols[safe: monthIndex] ?? "?"
                    case .shortMonthName:
                        return calendar.shortMonthSymbols[safe: monthIndex] ?? "?"
                    case .veryShortMonthName:
                        return calendar.veryShortMonthSymbols[safe: monthIndex] ?? "?"
                    case .weekdayName:
                        return calendar.weekdaySymbols[safe: weekdayIndex] ?? "?"
                    case .shortWeekdayName:
                        return calendar.shortWeekdaySymbols[safe: weekdayIndex] ?? "?"
                    case .veryShortWeekdayName:
                        return calendar.veryShortWeekdaySymbols[safe: weekdayIndex] ?? "?"
                    case .amSymbol:
                        return calendar.amSymbol
                    case .pmSymbol:
                        return calendar.pmSymbol
                    case .timeSymbol:
                        let hour = calendar.component(.hour, from: date)
                        return hour < 12 ? calendar.amSymbol : calendar.pmSymbol
                }
        }
    }
}

// MARK: - Fileprivate extension
fileprivate extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// MARK: - Factory Initializer
#if DEBUG
extension CustomTimeFormatter {
    
    /// Returns a new, isolated instance of `CustomTimeFormatter` for testing purposes.
    ///
    /// - Returns: A fresh `CustomTimeFormatter` instance, separate from the shared singleton.
    ///
    /// Use this method in unit tests.
    internal static func mock() -> CustomTimeFormatter {
        CustomTimeFormatter()
    }
}
#endif
