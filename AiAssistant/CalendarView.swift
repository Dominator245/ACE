//
//  CalendarView.swift
//  AiAssistant
//
//  Created by  on 6/12/23.
//

import SwiftUI
import FSCalendar
import UIKit

struct CalendarView: View
{
    @State var selectedDate: Date = Date()
    
    var body: some View
    {
        VStack
        {
            CalendarViewRepresentable()
        }
    }
}

struct CalendarViewRepresentable: UIViewRepresentable
{
    typealias UIViewType = FSCalendar
    
    fileprivate var calendar = FSCalendar()

    func makeUIView(context: Context) -> FSCalendar
    {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator

        return FSCalendar()
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {}

    func makeCoordinator() -> Coordinator
    {
        Coordinator(self)
    }

    class Coordinator: NSObject,
          FSCalendarDelegate, FSCalendarDataSource
    {
            var parent: CalendarViewRepresentable

            init(_ parent: CalendarViewRepresentable)
            {
                self.parent = parent
            }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
