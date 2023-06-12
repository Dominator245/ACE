//
//  ChatButtonView.swift
//  AiAssistant
//
//  Created by  on 5/25/23.
//

import SwiftUI

struct ChatButtonView: View
{
    var body: some View
    {
        ZStack
        {
            Image("mBackground").resizable().ignoresSafeArea()
            VStack
            {
               NavigationLink(destination:
               {
                   ChatView()
               })
                {
                    ZStack
                    {
                        Circle().frame(width: UIScreen.main.bounds.width * 1).foregroundColor(Color.blue).opacity(0.3)
                        ZStack
                        {
                            Circle().frame(width: UIScreen.main.bounds.width * 0.8).foregroundColor(Color.blue).opacity(0.5)
                            ZStack
                            {
                                Circle().frame(width: UIScreen.main.bounds.width * 0.6).foregroundColor(Color.blue).opacity(0.7).overlay{Text("Chat Now").font(.system(size: 40, weight: .heavy)).foregroundColor(Color.black)}
                            }
                        }
                    }
                }
            }
        }
    }
    
}

struct ChatButtonView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ChatButtonView()
    }
}
