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
    @State private var t1 = ""
    @State private var t2 = "1"

    var body: some View {
        Grid{
            GridRow{
                HStack{
                    Image("icons/event_upcoming")
                    Text(String.Localized.Home.Label.checkin.localized)
                }
                Spacer()
                TextField(String.Localized.Home.Placeholder.checkin.localized, text: $t1)
            }
            Divider()
            GridRow{
                HStack{
                    Image("icons/event_available")
                    Text(String.Localized.Home.Label.checkout.localized)
                }
                Spacer()
                TextField(String.Localized.Home.Placeholder.checkout.localized, text: $t1)                            }
            Divider()
            GridRow{
                HStack{
                    Image("icons/person")
                    Text(String.Localized.Home.Label.adults.localized)
                }
                Spacer()
                TextField("", text: $t2)
            }
            Divider()
            GridRow{
                HStack{
                    Image("icons/supervisor_account")
                    Text(String.Localized.Home.Label.childrens.localized)
                }
                Spacer()
                TextField("", text: $t2)
            }
        }
        .frame(height: 208.0)
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
}
