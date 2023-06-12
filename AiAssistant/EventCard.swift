//
//  EventCard.swift
//  AiAssistant
//
//  Created by  on 6/7/23.
//

import SwiftUI

struct EventCard: View
{
    @State var newDate: String = ""
    @State var newName: String = ""
    @State var newLocation: String = ""
    @State var newNotes: String = ""
    @EnvironmentObject var EventModel: Event
    var body: some View
    {
        ZStack
        {
            VStack
            {
                RoundedRectangle(cornerRadius: 25).frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2).foregroundColor(Color.black).shadow(color: Color.gray, radius: 15).overlay{(LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)).clipShape(RoundedRectangle(cornerRadius: 25))}.overlay
                {
                    HStack
                    {
                        VStack
                        {
                            Text(newName).font(.title3).foregroundColor(Color.white)
                            Text(newLocation).font(.caption).foregroundColor(Color.white).padding(.vertical, 1)
                            Text("\(newDate)").font(.subheadline).foregroundColor(Color.white)                            
                        }
                        .padding()
                        .bold()
                        .underline()
                        
                        ScrollView
                        {
                            Text(newNotes)
                                .lineLimit(nil)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .padding()
                    }
                }
                
            }
            .onAppear
            {
                dateFormat()
                newInfo()
                EventModel.clearAlert()
            }
        }
    }
    func dateFormat()
    {
        let date = EventModel.date
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        newDate = formatter.string(from: date)
    }
    func newInfo()
    {
        let name = EventModel.name
        newName = name
        let location = EventModel.location
        newLocation = location
        let notes = EventModel.notes
        newNotes = notes
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard().environmentObject(Event())
    }
}
