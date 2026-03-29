//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 24/12/25.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var listingCopy = [Listing]()
    @Published var searchLocation: String =  ""
    
    var service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        Task {
            await fetchListings()
        }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingCopy = listings
        } catch {
            print("Error:- \(error.localizedDescription)")
        }
    }
    
    func updateListingAsPerLocation() {
        listings = listingCopy
        let filteredListings = listings.filter {
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        }
        
        self.listings = filteredListings.isEmpty ? listingCopy : filteredListings
    }
}
