//
//  DeveloperPreview.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 24/12/25.
//

import Foundation

class DeveloperPreview {
    
    static var listings: [Listing] = [
        
        Listing(
            id: UUID().uuidString,
            imageURLs: ["listing-1", "listing-2", "listing-3", "listing-4"],
            ownerUid: UUID().uuidString,
            ownerName: "Amit Sharma",
            ownerImageUrl: "host1",
            numberOfBedrooms: 2,
            numberOfBathrooms: 2,
            numberOfGuests: 4,
            numberOfBeds: 2,
            pricePerNight: 3200,
            latitude: 19.0760,
            longtitude: 72.8777,
            address: "Bandra West",
            city: "Mumbai",
            state: "Maharashtra",
            title: "Modern Apartment in Bandra",
            rating: 4.7,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .kitchen, .tv, .laundry, .balcony],
            type: [.apartment]
        ),
        
        Listing(
            id: UUID().uuidString,
            imageURLs: ["listing-4", "listing-3", "listing-2", "listing-1"],
            ownerUid: UUID().uuidString,
            ownerName: "Riya Patel",
            ownerImageUrl: "host2",
            numberOfBedrooms: 3,
            numberOfBathrooms: 3,
            numberOfGuests: 6,
            numberOfBeds: 3,
            pricePerNight: 5800,
            latitude: 18.5204,
            longtitude: 73.8567,
            address: "Viman Nagar",
            city: "Pune",
            state: "Maharashtra",
            title: "Luxury Villa with Pool",
            rating: 4.9,
            features: [.superHost],
            amenities: [.pool, .wifi, .kitchen, .tv, .balcony],
            type: [.villa]
        ),
        
        Listing(
            id: UUID().uuidString,
            imageURLs: ["listing-2", "listing-4", "listing-3", "listing-1"],
            ownerUid: UUID().uuidString,
            ownerName: "Arjun Mehta",
            ownerImageUrl: "host3",
            numberOfBedrooms: 1,
            numberOfBathrooms: 1,
            numberOfGuests: 2,
            numberOfBeds: 1,
            pricePerNight: 1800,
            latitude: 28.7041,
            longtitude: 77.1025,
            address: "Connaught Place",
            city: "Delhi",
            state: "Delhi",
            title: "Cozy Studio near Metro",
            rating: 4.5,
            features: [.selfCheckIn],
            amenities: [.wifi, .kitchen, .tv],
            type: [.apartment]
        ),
        
        Listing(
            id: UUID().uuidString,
            imageURLs: ["listing-1", "listing-3", "listing-4", "listing-2"],
            ownerUid: UUID().uuidString,
            ownerName: "Neha Verma",
            ownerImageUrl: "host4",
            numberOfBedrooms: 4,
            numberOfBathrooms: 4,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 7200,
            latitude: 15.2993,
            longtitude: 74.1240,
            address: "Anjuna Beach Road",
            city: "Goa",
            state: "Goa",
            title: "Beachside Villa with Balcony",
            rating: 4.8,
            features: [.superHost],
            amenities: [.pool, .wifi, .kitchen, .balcony, .alarmSystem],
            type: [.villa]
        ),
        
        Listing(
            id: UUID().uuidString,
            imageURLs: ["listing-4", "listing-2", "listing-1", "listing-3"],
            ownerUid: UUID().uuidString,
            ownerName: "Kunal Singh",
            ownerImageUrl: "host5",
            numberOfBedrooms: 2,
            numberOfBathrooms: 1,
            numberOfGuests: 3,
            numberOfBeds: 2,
            pricePerNight: 2600,
            latitude: 12.9716,
            longtitude: 77.5946,
            address: "Indiranagar",
            city: "Bangalore",
            state: "Karnataka",
            title: "Quiet Home near Tech Parks",
            rating: 4.6,
            features: [.selfCheckIn],
            amenities: [.wifi, .office, .laundry, .tv],
            type: [.house]
        ),
        
        Listing(
            id: UUID().uuidString,
            imageURLs: ["listing-1", "listing-2", "listing-3", "listing-4"],
            ownerUid: UUID().uuidString,
            ownerName: "Sneha Iyer",
            ownerImageUrl: "host6",
            numberOfBedrooms: 3,
            numberOfBathrooms: 2,
            numberOfGuests: 5,
            numberOfBeds: 3,
            pricePerNight: 4100,
            latitude: 13.0827,
            longtitude: 80.2707,
            address: "Besant Nagar",
            city: "Chennai",
            state: "Tamil Nadu",
            title: "Spacious Townhouse near Beach",
            rating: 4.4,
            features: [.superHost],
            amenities: [.wifi, .kitchen, .balcony, .tv],
            type: [.townhouse]
        )
    ]
}
