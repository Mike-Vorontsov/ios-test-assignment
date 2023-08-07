//
//  HotelListView.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 07/08/2023.
//

import SwiftUI

struct HotelListView: View {
    internal init(viewModel: HotelListViewModel = HotelListViewModel() ) {
        self.viewModel = viewModel
    }
    
    var viewModel: HotelListViewModel
    
    var body: some View {
        List(viewModel.cells) {
            HotelCellView(viewModel: $0)
        }
    }
}

struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView()
    }
}
