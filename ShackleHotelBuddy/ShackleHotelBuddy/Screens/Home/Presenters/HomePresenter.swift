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
    let coordinator: Coordinator
    
    private var bag: Set<AnyCancellable> = []
    
    var homeViewModel: HomeViewModel = HomeViewModel()
    var resultsViewModel: HotelListViewModel = HotelListViewModel(cells: [])

    init(apiService: ListApiFetching, coordinator: Coordinator) {
        self.apiService = apiService
        self.coordinator = coordinator
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
            .map {
                $0.data.propertySearch.properties.map {
                    HotelCellViewModel(
                        id: $0.id,
                        name: $0.name,
                        imageUrl: $0.propertyImage.image.url ,
                        rating: "",
                        location: "",
                        price: ""
                    )
                }
            }
            .sink { [weak self] completion in
                self?.togglehSearch(to: true)
                print("Completed: \(completion)")
                if case .finished =  completion {
                    self?.coordinator.showResults = true
                }
            } receiveValue: { [weak self] value in
                self?.resultsViewModel.cells = value
                print("Value: \(value)")
            }
            .store(in: &bag)
    }
    
}
