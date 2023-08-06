//
//  HomeView.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 02/08/2023.
//

import SwiftUI

struct Consts {
    struct UI {
        static let padding = 16.0
        struct Icon {
            static let iconSize = 32.0
            static let corerRadius = 8.0
            
        }
        struct Button {
            static let height = 24.0
        }
    }
}

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel = .init()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            HStack{
                Image("images/logo")
                Spacer()
                Image("icons/person")
                    .resizable()
                    .frame(width: Consts.UI.Icon.iconSize, height: Consts.UI.Icon.iconSize)
                
                    .background(.gray)
                    .cornerRadius(Consts.UI.Icon.corerRadius)
            }
            
            Spacer()
            
            Text(String.Localized.Home.header.localized)
                .font(.largeTitle)
                .foregroundColor(Color.white)
            
            Spacer()
            SearchView(viewModel: viewModel.searchViewModel)
            Spacer()
            Button {
                viewModel.searchButtonAction.send()
            } label: { Text(String.Localized.Home.searchButton.localized)
                    .frame(maxWidth: .infinity)
                    .frame(height: Consts.UI.Button.height)
                    .cornerRadius(Consts.UI.Fields.cornerRadius)
            }
                .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(SwiftUI.EdgeInsets(top: 0, leading: Consts.UI.padding, bottom: 0, trailing: Consts.UI.padding))
        .background(
            Image("images/background")
                .resizable(resizingMode: .stretch)
                .edgesIgnoringSafeArea([.all])
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
