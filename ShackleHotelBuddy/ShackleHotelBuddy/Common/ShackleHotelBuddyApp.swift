//
//  ShackleHotelBuddyApp.swift
//  ShackleHotelBuddy
//
//  Created by Shackle on 07/07/2023.
//

import SwiftUI

@main
struct ShackleHotelBuddyApp: App {
    
    let homePresenter: HomePresenter = .init()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: homePresenter.homeViewModel)
                .onAppear {
                    homePresenter.setup()
                }
        }
    }
}
