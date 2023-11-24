//
//  SwiftUIView.swift
//  MapApp
//
//  Created by Macbook Air on 23/11/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: LocationsView()) {
                    Text("Login")
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SwiftUIView()
}
