//
//  HotelCellViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 07/08/2023.
//

import Foundation

struct HotelCellViewModel: Identifiable {
    let id: String
    let name: String
    let imageUrl: URL
    let rating: String
    let location: String
    let price: String
}
