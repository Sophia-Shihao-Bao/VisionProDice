//
//  visionDiceApp.swift
//  visionDice
//
//  Created by Sophia Bao on 2024-10-28.
//

import SwiftUI

@Observable
class DiceData: ObservableObject {
    var rolledNumber = 0
}

@main
struct visionDiceApp: App {
    @State var diceData = DiceData()
    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView(diceData:diceData)
                .environment(appModel)
        }
        .defaultSize(width: 100, height: 100)
        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView(diceData: DiceData())
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
