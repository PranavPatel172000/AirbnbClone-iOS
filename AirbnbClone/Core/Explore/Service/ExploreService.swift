//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 24/12/25.
//

import Foundation

class ExploreService {
    
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.listings
    }
}
