//
//  ListingDetailsView.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 19/12/25.
//

import SwiftUI
import MapKit

struct ListingDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude,
                                           longitude: listing.longtitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1,
                                   longitudeDelta: 0.1)
        )
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // Tabview Image -
                ZStack(alignment: .topLeading){
                    ListingImageCarouselView(images: listing.imageURLs)
                        .frame(height: 350)
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .background {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 32, height: 32)
                            }
                            .padding(.top, 64)
                            .padding(.leading, 32)
                    }

                }
                
                
                // Tabview details
                VStack(alignment: .leading) {
                    Text("\(listing.title)")
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            
                        Text("\(listing.rating) -")
                            
                        Text("28 reviews")
                            .underline()
                            
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    
                    Text("\(listing.city), \(listing.state)")
                        .font(.caption)
                }
                .padding(.leading)
                
                // divider
                Divider()
                
                // owner details
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Entire \(listing.type[0].descr) hosted by \(listing.ownerName)")
                            .frame(width: 250, alignment: .leading)
                            .font(.headline)
    
                        HStack {
                            Text("\(listing.numberOfGuests) guests - \(listing.numberOfBedrooms) bedrooms - \(listing.numberOfBeds) beds - \(listing.numberOfBathrooms) baths")
                        }
                        .font(.caption)
                        .frame(width: 300, alignment: .leading)
                    }
                    
                    Spacer()
                    
                    Image("\(listing.ownerImageUrl)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                }
                .padding()
                
                Divider()
                
                // Room details
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(listing.features, id: \.self) { feature in
                        HStack(spacing: 12) {
                            Image(systemName: "\(feature.imageName)")
                            
                            VStack(alignment: .leading) {
                                Text("\(feature.title)")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                
                                Text("\(feature.subTitle)")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                        }
                    }
                }
                .padding()
                
                Divider()
                
                // more details view
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll sleep")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(1...listing.numberOfBedrooms, id: \.self) { bedroom in
                                VStack(spacing: 5) {
                                    Image(systemName: "bed.double")
                                    
                                    Text("bedroom \(bedroom)")
                                }
                                .frame(width: 132, height: 100)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
                .padding()
                
                Divider()
                
                //Place offer view
                VStack(alignment: .leading, spacing: 16) {
                    Text("What this place offers")
                        .font(.headline)
                    
                    ForEach(listing.amenities) { amenity in
                            HStack {
                                Image(systemName: "\(amenity.imageName)")
                                    .frame(width: 32)
                                
                                Text("\(amenity.title)")
                                    .font(.footnote)
                                
                                Spacer()
                            }
                    }
                }
                .padding()
                
                Divider()
                
                // Map view
                VStack(alignment: .leading, spacing: 16){
                    Text("Where you'll be")
                        .font(.headline)
                    
                    Map(position: $cameraPosition)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before Taxes")
                            .font(.footnote)
                        
                        Text("oct 15 - 20 ")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailsView(listing: DeveloperPreview.listings[3])
}
