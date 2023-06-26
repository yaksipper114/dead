//
//  chatGPT.swift
//  RallyUp
//
//  Created by Ben Fichter on 6/25/23.
//

import SwiftUI
import Foundation
import OpenAISwift

let openAI = OpenAISwift(authToken: "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")

func chatGPT(inputPrompt: String) async -> OpenAI<MessageResult>? {
    var result: OpenAI<MessageResult>?
    do {
        let chat: [ChatMessage] = [ChatMessage(role: .system, content: inputPrompt)]
        result = try await openAI.sendChat(
            with: chat,
            model: .chat(.chatgpt),         // optional `OpenAIModelType`
            user: nil,                      // optional `String?`
            temperature: 1,                 // optional `Double?`
            topProbabilityMass: 1,          // optional `Double?`
            choices: 1,                     // optional `Int?`
            stop: nil,                      // optional `[String]?`
            maxTokens: nil,                 // optional `Int?`
            presencePenalty: nil,           // optional `Double?`
            frequencyPenalty: nil,          // optional `Double?`
            logitBias: nil                 // optional `[Int: Double]?` (see inline documentation)
        )
        
    }
    catch {
    }
    return result
}
