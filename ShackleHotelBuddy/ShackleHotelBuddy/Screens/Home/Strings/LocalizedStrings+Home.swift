//
//  LocalizedStrings+Home.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Foundation

extension String.Localized {
    
    enum Home: String, Localizable {
        case header = "Home.Text.Header"
        case recentSearches = "Home.Text.Recent"
        case searchButton = "Home.Button.Search"
                
        enum Label: String, Localizable {
            case children = "Home.Label.Children"
            case adults = "Home.Label.Adults"
            case checkin = "Home.Label.Checkin"
            case checkout = "Home.Label.Checkout"
        }
        
        enum Placeholder: String, Localizable {
            case checkin = "Home.Placeholder.Checkin"
            case checkout = "Home.Placeholder.Checkout"
        }
    }
}
