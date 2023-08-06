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
    
    private func togglehSearch(to enabled: Bool) {
        homeViewModel.isSearchButtonEnabled = enabled
        homeViewModel.isActivityIndicatorSpinning = !enabled
    }
    
    private func search() {
        togglehSearch(to: false)
        apiService
            .fetchList(with: .init(resultsStartingIndex: 0))
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.togglehSearch(to: true)
                print("Completed: \(completion)")
            } receiveValue: { value in
                print("Value: \(value)")
            }
            .store(in: &bag)
    }
    
}
