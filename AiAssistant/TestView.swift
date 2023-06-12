//
//  TestView.swift
//  AiAssistant
//
//  Created by  on 6/5/23.
//

import SwiftUI

//struct TestView: View {
//  @State private var showingAlert = false
//
//  var body: some View {
//    NavigationView {
//      NavigationLink {
//
//        Button(action: {
//          showingAlert = true
//        }, label: {
//          Text("Show dialog")
//        })
//        .alert("", isPresented: $showingAlert, actions: {
//          Button("refresh") {
//          }
//        })
//
//      } label: {
//        Text("Show detail")
//      }
//    }
//  }
//}



struct Card: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct TestView: View {
    @State private var titleText = ""
    @State private var descriptionText = ""
    @State private var cards = [Card]()

    var body: some View
    {
        VStack
        {
            HStack {
                TextField("Title", text: $titleText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Description", text: $descriptionText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add Card") {
                    let card = Card(title: titleText, description: descriptionText)
                    cards.append(card)
                    titleText = ""
                    descriptionText = ""
                }
            }
            .padding()

            List(cards) { card in
                VStack(alignment: .leading) {
                    Text(card.title)
                        .font(.headline)
                    Text(card.description)
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
