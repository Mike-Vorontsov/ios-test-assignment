//
//  ShackleHotelBuddyApp.swift
//  ShackleHotelBuddy
//
//  Created by Shackle on 07/07/2023.
//

import SwiftUI

@main
struct ShackleHotelBuddyApp: App {
    init() {
        self.init(homePresenter: Injector.shared.homePresenter)
    }
    
    private let homePresenter: HomePresenting
    
    init(homePresenter: HomePresenting) {
        self.homePresenter = homePresenter
    }
  
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: homePresenter.homeViewModel)
                .onAppear {
                    homePresenter.setup()
                }
        }
    }
}
