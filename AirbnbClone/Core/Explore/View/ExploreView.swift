//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 18/12/25.
//

import SwiftUI

struct ExploreView: View {
    
    @State var showDestinationSearchView: Bool = false
    @StateObject var viewModel: ExploreViewModel = .init(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView,                             viewModel: viewModel)
            } else {
                ScrollView {
                    
                    SearchAndFilterBar(searchLocation: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                           
                        }
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                            }
                        }
                    }
                    .padding()
                }
                
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailsView(listing: listing)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
