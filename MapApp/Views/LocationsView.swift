//
//  LocationsView.swift
//  MapApp
//
//  Created by Macbook Air on 23/11/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapPosition){
                Marker(vm.mapLocation.name, coordinate: vm.mapLocation.coordinates)
                
            
            }
            .ignoresSafeArea()
            
            
        
            
            VStack(spacing: 0){
                header
                .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationPreviewView(location: location)
                                .padding()
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

extension LocationsView {
    private var header : some View {
        VStack {
            Button(action: {vm.toggleLocationsList()}, label: {
                Text(vm.mapLocation.name + " " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(Color.primary)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            })
            
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black, radius: 20, x: 0, y: 15)
        
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
