//
//  HomeViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Combine

final class HomeViewModel: ObservableObject {
    let searchViewModel: SearchViewModel = .init()
    
    let searchButtonAction: PassthroughSubject<Void, Never> = .init()
}
