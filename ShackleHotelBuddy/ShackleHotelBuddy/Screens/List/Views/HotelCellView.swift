//
//  HotelCellView.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 07/08/2023.
//

import SwiftUI
import Kingfisher

struct HotelCellView: View {
    internal init(
        viewModel: HotelCellViewModel =  HotelCellViewModel(
            id: String(UUID().hashValue),
            name: "Beverly hotel",
            imageUrl: URL(string: "https://www.berjayahotel.com/sites/default/files/styles/gallery_slide/public/colombo_30.jpg")!,
            rating: "",
            location: "",
            price: ""
        )
    ) {
        self.viewModel = viewModel
    }
    
    
    var viewModel: HotelCellViewModel
    
    var body: some View {
        VStack{
            KFImage
                .url(viewModel.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: Consts.UI.Cell.height)
                .cornerRadius(Consts.UI.Cell.cornerRadius)
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.name)
                        .font(.headline)
                    Spacer()
                    Image("icons/grade")
                    Text("4.5")
                }
                Text(viewModel.location)
                    .font(.caption)
                Text("£100 night")
                    .font(.body)
            }
        }
        .padding(Consts.UI.padding)

    }
}

struct HotelCellView_Previews: PreviewProvider {
    static var previews: some View {
        HotelCellView()
    }
}

extension Consts.UI {
    enum Cell {
        static let height = 200.0
        static let cornerRadius = Consts.UI.Icon.corerRadius
    }
}
