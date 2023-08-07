//
//  NavigationView.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Foundation
import Combine
import SwiftUI

struct RootView: View {
    
    @ObservedObject var coordinator: Coordinator = Coordinator()
    
    var body: some View {
        NavigationView {
            VStack {
                HomeView(viewModel: Injector.shared.homePresenter.homeViewModel)
                NavigationLink(
                    destination: HotelListView(viewModel: Injector.shared.homePresenter.resultsViewModel),
                    isActive: $coordinator.showResults
                ) {
                    EmptyView()
                }
            }
        }
    }
}
