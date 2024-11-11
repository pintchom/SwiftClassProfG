//
//  SpotDetailView.swift
//  Snacktacular
//
//  Created by Max Pintchouk on 11/10/24.
//

import SwiftUI

struct SpotDetailView: View {
    @State var spot: Spot
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Group {
                TextField("name", text: $spot.name)
                    .font(.title)
                TextField("address", text: $spot.address)
                    .font(.title2)
            }
            .textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                
            }
            .padding(.horizontal)
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("submit") {
                    let success = SpotViewModel.saveSpot(spot: spot)
                    if success {
                        dismiss()
                    } else {
                        print("Save Failed")
                    }
                }
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        SpotDetailView(spot: Spot())
    }
}
