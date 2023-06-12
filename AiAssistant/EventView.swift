//
//  EventView.swift
//  AiAssistant
//
//  Created by  on 5/30/23.
//

import SwiftUI

struct EventView: View
{
    @State var showAlert: Bool = false
    
    @State var events: [Event] = []
    
    @EnvironmentObject var EventModel: Event
    @EnvironmentObject var alertController: eventAlertController

    var body: some View
    {
        ZStack
        {
            VStack
            {
                HStack(spacing: UIScreen.main.bounds.width * 0.25)
                {
                    Button
                    {
                        if events.isEmpty
                        {
                        }
                        else
                        {
                            events.removeLast()
                        }
                    }
                label:
                    {
                        EventButtonsView(bgColor: Color.blue, text: "Delete")
                    }

                    Button
                    {
                        alertController.showAlert.toggle()
                    }
                label:
                    {
                        EventButtonsView(bgColor: Color.blue, text: "Create")
                    }
                }
                
                Spacer()
                
                List
                {
                    ForEach(events)
                    { event in
                        EventCard()
                    }
                }
                .listStyle(.plain)
            }
            .alert("Event Creation", isPresented: $alertController.showAlert)
            {
                VStack
                {
                    TextField("Enter Event Name", text: $EventModel.name)
                    
                    TextField("Enter Event Location", text: $EventModel.location)
                    TextField("Enter Event Notes", text: $EventModel.notes)
                    Button(action:
                            {
                        alertController.showDatePicker = true
                    })
                    {
                        Text(EventModel.date, style: .date)
                    }
                    
                    HStack
                    {
                        Button("Save", action: save)
                        Button("Cancel", role: .cancel)
                        {
                            EventModel.clearAlert()
                        }
                    }
                }
            }
            .sheet(isPresented: $alertController.showDatePicker)
            {
                DatePickerView()
                    .environmentObject(EventModel)
                    .onDisappear
                    {
                        alertController.showDatePicker = false
                        alertController.showAlert = true
                    }
            }
        }
        .onChange(of: alertController.showAlert)
        { showAlert in
          if showAlert
            {
              DispatchQueue.main.async
              {
                  self.showAlert = true
              }
          }
        }
    }
    func save()
    {
        //Create Event
        let newEvent = Event()
        events.append(newEvent)
    }
}

struct EventButtonsView: View
{
    @State var bgColor: Color = Color.blue
    @State var text: String = ""
    
    @EnvironmentObject var EventModel: Event
    @EnvironmentObject var alertController: eventAlertController

    var body: some View
    {
        
        RoundedRectangle(cornerRadius: 15).frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.06).foregroundColor(bgColor).shadow(radius: 15).overlay{(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 15))}.overlay{Text(text).font(.system(size: 25, weight: .heavy)).foregroundColor(Color.black)}
    }
  
}

struct DatePickerView: View
{
    
    @EnvironmentObject var EventModel: Event
    @EnvironmentObject var alertController: eventAlertController

    var body: some View
    {
        VStack
        {
            DatePicker("", selection: $EventModel.date, displayedComponents: [.date]).datePickerStyle(.wheel).frame(width: 200, height: 200)
            HStack
            {
                Button(action:
                {
                    alertController.showDatePicker = false
                    print(EventModel.date)
                })
                {
                    RoundedRectangle(cornerRadius: 15).frame(width: 100, height: 50).foregroundColor(Color.blue).shadow(radius: 15).overlay{(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 15))}.overlay{Text("Done").font(.system(size: 25, weight: .heavy)).foregroundColor(Color.black)}
                }
            }
            .padding(UIScreen.main.bounds.height / 25)
        }
    }
}

struct EventView_Previews: PreviewProvider
{
    static var previews: some View
    {
        EventView()
            .environmentObject(Event()).environmentObject(eventAlertController())
    }
}
