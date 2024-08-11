//
//  ContentView.swift
//  Football Challenge
//
//  Created by Adrian Richard Talbot on 11/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var apiKey: String? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Text("Your API_KEY is: \(apiKey ?? "nil")")
            
            Spacer()
            Button("Click for teams") {
                getTeams()
            }
        }
        .padding()
        .onAppear(perform: {
            apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
        })
    }
    
    func getTeams() {
        print("Not implemented yet")
    }
}

#Preview {
    ContentView()
}
