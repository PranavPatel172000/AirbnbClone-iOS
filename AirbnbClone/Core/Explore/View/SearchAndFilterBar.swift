//
//  SearchAndFilterBar.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 18/12/25.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var searchLocation: String
    
    var body: some View {
        
        HStack {
            // Image
            Image(systemName: "magnifyingglass")
            
            // Text
            VStack(alignment: .leading) {
                Text(searchLocation.isEmpty ? "Where to?" : searchLocation)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("\(searchLocation.isEmpty ? "Anywhere - " : "")Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            // Image
            Image(systemName: "line.3.horizontal.decrease.circle")
                .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(searchLocation: .constant("Mumbai"))
}
