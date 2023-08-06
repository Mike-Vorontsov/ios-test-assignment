//
//  HomeViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Combine

final class HomeViewModel: ObservableObject {
    let searchViewModel: SearchViewModel = .init()
    
    @Published var isActivityIndicatorSpinning: Bool = false
    @Published var isSearchButtonEnabled: Bool = true
    
    let searchButtonAction: PassthroughSubject<Void, Never> = .init()
}
