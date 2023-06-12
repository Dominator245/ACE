//
//  EventView.swift
//  AiAssistant
//
//  Created by  on 5/30/23.
//

import SwiftUI

struct EventAppView: View
{
    @State var selectedTab: Int = 0
    
    var body: some View
    {
        ZStack
        {
            VStack
            {
                TabView(selection: $selectedTab)
                {
                    EventView().tabItem
                    {
                        Image(systemName: "paperplane.fill")
                        Text("Events")
                    }
                    .tag(0)
                    
                    CalendarView().tabItem
                    {
                        Image(systemName: "calendar.circle.fill")
                        Text("Calendar")
                    }
                    .tag(1)
                    
                }
                .accentColor(Color.red)
            }
        }
    }
}

struct EventAppView_Previews: PreviewProvider
{
    static var previews: some View
    {
        EventAppView()
    }
}
