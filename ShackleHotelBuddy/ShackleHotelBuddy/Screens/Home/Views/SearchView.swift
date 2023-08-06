//
//  SearchView.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 02/08/2023.
//

import SwiftUI

struct HDivider: View {
    var body: some View {
        Rectangle()
            .frame(width: 1)
    }
}

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    init(viewModel: SearchViewModel = .init()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Grid{
            GridRow{
                HStack{
                    Image("icons/event_upcoming")
                    Text(String.Localized.Home.Label.checkin.localized)
                }
                Spacer()
                TextField(String.Localized.Home.Placeholder.checkin.localized, text: $viewModel.checkin)
            }
            Divider()
            GridRow{
                HStack{
                    Image("icons/event_available")
                    Text(String.Localized.Home.Label.checkout.localized)
                }
                Spacer()
                TextField(String.Localized.Home.Placeholder.checkout.localized, text: $viewModel.checkout)                            }
            Divider()
            GridRow{
                HStack{
                    Image("icons/person")
                    Text(String.Localized.Home.Label.adults.localized)
                }
                Spacer()
                TextField("", text: $viewModel.adults)
            }
            Divider()
            GridRow{
                HStack{
                    Image("icons/supervisor_account")
                    Text(String.Localized.Home.Label.children.localized)
                }
                Spacer()
                TextField("", text: $viewModel.children)
            }
        }
        .frame(height: Consts.UI.Search.height)
        .background(.white)
        .cornerRadius(Consts.UI.Fields.cornerRadius)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().background(.gray)
    }
}

extension Consts.UI {
    struct Fields {
        static let cornerRadius = 16.0
    }
    struct Search {
        static let height = 208.0
    }
                            
}
