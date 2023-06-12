//
//  ChatView.swift
//  AiAssistant
//
//  Created by  on 5/25/23.
//

import SwiftUI

struct ChatView: View
{
    @ObservedObject var viewModel = ViewModel()
    @State var text: String = ""
    @State var models = [String]()
    
    let buttonGradient = (LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
    
    var body: some View
    {
        ZStack
        {
            VStack(alignment: .leading)
            {
                ForEach(models, id: \.self)
                {
                    string in HStack
                    {
                        Text(string)
                    }
                }
                Spacer()
                HStack
                {
                    TextField("Enter", text: $text).textFieldStyle(OvalTextFieldStyle()).frame(width: UIScreen.main.bounds.width * 0.75).foregroundColor(Color.black)
                    Button(action:
                    {
                        send()
                    })
                    {
                        RoundedRectangle(cornerRadius: 20).frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.053).overlay{Text("Send").font(.system(size: 18, weight: .heavy)).foregroundColor(Color.black)}
                    }
                }
            }.onAppear{viewModel.setup()}
        }
    }
    func send()
    {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty
           else
           {
               return
           }
           models.append("Me: \(text)")
           viewModel.send(text: text)
           {
               result in print(result)
               self.models.append("chatGpt: " + result)
           }
           self.text = ""
    }
}

struct OvalTextFieldStyle: TextFieldStyle
{
    func _body(configuration: TextField<Self._Label>) -> some View
    {
        configuration
            .padding(11)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}


struct ChatView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ChatView()
    }
}
