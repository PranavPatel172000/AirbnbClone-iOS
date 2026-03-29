//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 18/12/25.
//

import SwiftUI

struct ListingItemView: View {
    
    var listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            //Image
            ListingImageCarouselView(images: listing.imageURLs)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(height: 300)
            
            //listing detail
            VStack(alignment: .leading) {
                HStack {
                    Text("\(listing.state), \(listing.city)")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                            .fontWeight(.semibold)
                    }
                }
                .foregroundStyle(.black)
                
                Group {
                    Text("12 min away")
                    Text("Nov 3 - 10")
                }
                .foregroundStyle(.gray)
                
                HStack {
                    Text("$\(listing.pricePerNight)")
                        .fontWeight(.semibold)
                    Text("night")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.listings[0])
}
