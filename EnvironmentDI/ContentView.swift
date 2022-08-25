//
//  ContentView.swift
//  EnvironmentDI
//
//  Created by Kotaro Fukuo on 2022/08/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.service) private var service
    @State private var result: String = ""
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    do {
                        result = try await service.execute()
                    } catch {
                        print(">>> error: \(error)")
                    }
                }
            }, label: {
                Text("Tap!!!")
            })
            Text(result)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
