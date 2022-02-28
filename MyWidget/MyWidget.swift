//
//  MyWidget.swift
//  MyWidget
//
//  Created by 이민지 on 2022/02/24.
//

import WidgetKit
import SwiftUI
import Foundation
import RealmSwift
import FSCalendar

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
//        let midnight = Calendar.current.startOfDay(for: Date())
//        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
//        let entries = [SimpleEntry(date: midnight)]
//        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
//        completion(timeline)

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct MyWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    @Environment(\.colorScheme) var scheme
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color("WidgetBackground").frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                VStack(alignment: .leading) {
                    header
                    Spacer()
                }.padding(20)
                
                Spacer()
            }
        }
    }
    
    var header: some View {
        Group {
            Text(entry.date, style: .time)zcb
                .bold()
                .font(family == .systemLarge ? .system(size: 40) : .title)
                .minimumScaleFactor(0.5)
            Text("look!!")
                .font(family == .systemLarge ? .title : .headline)
        }
        .foregroundColor(Color("titleColor"))
    }
}

@main
struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("WAY Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

struct MyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MyWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .environment(\.colorScheme, .light)
//            .redacted(reason: .placeholder)
        MyWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .environment(\.colorScheme, .light)
//            .redacted(reason: .placeholder)
    }
}

//struct CalendarRepresentable {
//    typealias Body = FSCalendar
//
//    var calendar = FSCalendar()
//    var selectedDate: Date
//
//    func makeUIView(context: Context) -> FSCalendar {
//        calendar.delegate = context.coordinator
//        calendar.dataSource = context.coordinator
//
//
//        return calendar
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
//        var parent: CalendarRepresentable
//        init(_ parent: CalendarRepresentable) {
//            self.parent = parent
//        }
//
//
//    }
//
//    func updateUIView(_ uiView: FSCalendar, context: Context) {}
//}
