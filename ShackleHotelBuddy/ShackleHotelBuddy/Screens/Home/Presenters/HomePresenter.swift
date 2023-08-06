//
//  HomePresenter.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Combine

protocol HomePresenting {
    var homeViewModel: HomeViewModel { get }
    func setup()
}

final class HomePresenter: HomePresenting {
    
    private var bag: Set<AnyCancellable> = []
    
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    func setup() {
        homeViewModel.searchButtonAction
            .sink { [weak self] _ in
                self?.search()
            }
            .store(in: &bag)
    }
    
    private func search() {
        // TODO: implement search mechanic based on SearchViewModel
    }
    
}
