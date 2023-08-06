//
//  SearchViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Combine

final class SearchViewModel: ObservableObject {
    @Published var checkin: String = ""
    @Published var checkout: String = ""
    @Published var adults: String = "1"
    @Published var children: String = "0"
}
