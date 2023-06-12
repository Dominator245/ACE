//
//  AiAssistantApp.swift
//  AiAssistant
//
//  Created by  on 5/25/23.
//

import SwiftUI

@main
struct AiAssistantApp: App
{
    @StateObject var object = Event()
    @StateObject var controller = eventAlertController()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView().environmentObject(Event()).environmentObject(eventAlertController())
        }
    }
}
