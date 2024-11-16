//
//  ContentView.swift
//  visionDice
//
//  Created by Sophia Bao on 2024-10-28.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @ObservedObject var diceData:DiceData
    var body: some View {
        VStack {
            Text(diceData.rolledNumber == 0 ? "🎲":"\(diceData.rolledNumber)")
                .foregroundStyle(.yellow)
                .font(.custom("Menlo", size: 100))
                .bold()
        }
        .task {
            await openImmersiveSpace(id: "ImmersiveSpace")
        }
    }
}
#Preview(windowStyle:.automatic) {
    ContentView(diceData: DiceData())
}
