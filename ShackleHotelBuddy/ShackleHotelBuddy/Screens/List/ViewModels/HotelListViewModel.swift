//
//  HotelListViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 07/08/2023.
//

import Foundation
import Combine

final class HotelListViewModel: ObservableObject {
    internal init(cells: [HotelCellViewModel] =
        (0..<10).map {
            HotelCellViewModel(
                id: String($0),
                name: "Beverly \($0)",
                imageUrl: URL(string: "https://11")!,
                rating: "0",
                location: "0",
                price: "0"
            )
        }
    ) {
        self.cells = cells
    }
    
    @Published var cells: [HotelCellViewModel]
}
