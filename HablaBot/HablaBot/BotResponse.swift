//
//  BotResponse.swift
//  HablaBot
//
//  Created by Admin on 07/12/2024.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") { // logica del chatbot
        let responses = ["Hey there!", "Hello!", "Hi! Nice to see you!"]
        return responses.randomElement()!
    } else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, how are you!"
    } else {
        return "That's cool"
    }
}

