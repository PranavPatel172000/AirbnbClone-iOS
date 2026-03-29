//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by pranavashok.patel on 22/12/25.
//

import SwiftUI

enum DestinationType {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @State var selectedOption: DestinationType = .location
    @Binding var show: Bool
    @State var startDate = Date()
    @State var endDate = Date()
    @State var guestsCount: Int = 0
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            //Cross icon and clear button
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                        viewModel.updateListingAsPerLocation()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button {
                        viewModel.searchLocation = ""
                    } label: {
                        Text("Clear")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            // Where to view
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    VStack(alignment: .leading) {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            
                            TextField("Search for a destination", text: $viewModel.searchLocation)
                                .font(.headline)
                                .onSubmit {
                                    viewModel.updateListingAsPerLocation()
                                    show.toggle()
                                }
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            
            // Date selection view
            VStack {
                if selectedOption == .dates {
                    VStack(alignment: .leading) {
                        Text("When's your trip?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        VStack {
                            DatePicker("From", selection: $startDate, displayedComponents: .date)
                            
                            Divider()
                            
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    }
                } else {
                    CollapsedPickerView(title: "When", description: "add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 44)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }
            
            //Guest view
            VStack {
                if selectedOption == .guests {
                    VStack(alignment: .leading) {
                        Text("Who's coming?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Stepper {
                            Text("\(guestsCount) Adults")
                        } onIncrement: {
                            guestsCount += 1
                        } onDecrement: {
                            guard guestsCount > 0 else {
                                return
                            }
                            guestsCount -= 1
                        }
                    }
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 44)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
