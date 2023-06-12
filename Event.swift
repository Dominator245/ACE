//
//  Event.swift
//  AiAssistant
//
//  Created by  on 5/31/23.
//

import SwiftUI

class Event: ObservableObject, Identifiable
{    
    @Published var name: String = ""
    @Published var date: Date = Date()
    @Published var location: String = ""
    @Published var notes: String = ""
    
    func clearAlert()
    {
        name = ""
        date = Date()
        location = ""
        notes = ""
    }    
}

class eventAlertController: ObservableObject
{
    @Published var showDatePicker: Bool = false
    @Published var showAlert: Bool = false
}


