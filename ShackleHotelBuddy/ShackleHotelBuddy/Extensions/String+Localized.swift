//
//  String+Localized.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 02/08/2023.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

extension RawRepresentable where RawValue == String, Self: Localizable {
    var localized: String {
        NSLocalizedString(rawValue, comment: "")
    }
}

extension String {
    enum Localized {}
}
