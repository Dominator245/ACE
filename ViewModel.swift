//
//  ViewModel.swift
//  AiAssistant
//
//  Created by  on 5/25/23.
//

import Foundation
import OpenAISwift

public class ViewModel: ObservableObject
{
    init() {}
    private var client: OpenAISwift?
    func setup()
    {
        client = OpenAISwift(authToken: "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")
    }
    func send(text: String, completion: @escaping(String) -> Void)
    {
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler:
        { result in
            switch result
            {
            case.success(let model): let output = model.choices?.first?.text ?? ""
                completion(output)
                case.failure(_):
                    break
            }
        })
    }
}
