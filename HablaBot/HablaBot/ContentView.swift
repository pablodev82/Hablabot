//
//  ContentView.swift
//  HablaBot
//
//  Created by Admin on 06/12/2024.
//
 
import SwiftUI

struct ContentView: View {
    
    @State private var messageText = "" // Almacena el texto ingresado por el usuario
    @State var messages: [String] = ["Welcome to the HablaBot"] // Lista de mensajes
    
    var body: some View {
          VStack {
              // Título del Chat
              HStack {
                  Text("HablaBot")
                      .font(.largeTitle)
                      .bold()
                  Image(systemName: "bubble.left.fill")
                      .font(.system(size: 26))
                      .foregroundColor(.blue)
              }
              .padding()
              
              // Mensajes del Chat
              ScrollView {
                  VStack(alignment: .leading, spacing: 10) {
                      ForEach(messages, id: \.self) { message in
                          HStack {
                              if message.starts(with: "[USER]") {
                                  Spacer() // Empuja el mensaje hacia la derecha
                                  Text(message.replacingOccurrences(of: "[USER] ", with: ""))
                                      .padding()
                                      .foregroundColor(.white)
                                      .background(Color.blue.opacity(0.8))
                                      .cornerRadius(10)
                                      .frame(maxWidth: 250, alignment: .trailing)
                              } else {
                                  Text(message.replacingOccurrences(of: "[BOT] ", with: ""))
                                      .padding()
                                      .background(Color.green.opacity(0.5))
                                      .cornerRadius(10)
                                      .frame(maxWidth: 250, alignment: .leading)
                                  Spacer() // Empuja el mensaje del bot hacia la izquierda
                              }
                          }
                      }
                  }.rotationEffect(.degrees(180))
              }.rotationEffect(.degrees(180))
              .padding()
              .background(Color.orange.opacity(0.1))
              .cornerRadius(10)
              
              // Campo de Entrada de Mensaje
              HStack {
                  TextField("Type something", text: $messageText)
                      .padding()
                      .background(Color.gray.opacity(0.2))
                      .cornerRadius(10)
                  
                  Button(action: {
                      sendMessage()
                  }) {
                      Image(systemName: "paperplane.fill")
                          .foregroundColor(.white)
                          .padding()
                          .background(Color.blue)
                          .cornerRadius(10)
                  }
              }
              .padding()
          }
          .padding()
      }
    
    // Función para enviar mensajes
    func sendMessage() {
        guard !messageText.isEmpty else { return }
        
        // Agrega el mensaje del usuario
        withAnimation {
            messages.append("[USER] " + messageText)
        }
        
        // Obtiene respuesta del bot
        let botResponse = getBotResponse(message: messageText)
        withAnimation {
            messages.append("[BOT] " + botResponse)
        }
        
        // Limpia el campo de texto
        messageText = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

