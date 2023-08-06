//
//  HomePresenter.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Combine
import Foundation

protocol HomePresenting {
    var homeViewModel: HomeViewModel { get }
    func setup()
}

final class HomePresenter: HomePresenting {
    
    let apiService: ListApiFetching
    
    private var bag: Set<AnyCancellable> = []
    
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    init(apiService: ListApiFetching) {
        self.apiService = apiService
    }
    
    func setup() {
        homeViewModel.searchButtonAction
            .sink { [weak self] _ in
                self?.search()
            }
            .store(in: &bag)
    }
    
    private func search() {
        apiService
            .fetchList(with: .init(resultsStartingIndex: 0))
            .sink { completion in
                print("Completed: \(completion)")
            } receiveValue: { value in
                print("Value: \(value)")
            }
            .store(in: &bag)
    }
    
}
