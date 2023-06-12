//
//  ContentView.swift
//  AiAssistant
//
//  Created by  on 5/25/23.
//

import SwiftUI

struct ContentView: View
{
    @State var selectedTab: Int = 0
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                VStack
                {
                    TabView(selection: $selectedTab)
                    {
                        ChatButtonView().tag(0)
                        EventAppView().tag(1)
                    }
                    .gesture(DragGesture().onEnded { value in
                        if value.translation.height < 0
                        {
                            selectedTab = (selectedTab + 1) % 3
                        }
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView().preferredColorScheme(.light)
        ContentView().preferredColorScheme(.dark)
    }
}
