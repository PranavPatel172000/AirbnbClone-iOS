//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 20/12/25.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    var images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(images: [DeveloperPreview.listings[0].imageURLs[0]])
}
