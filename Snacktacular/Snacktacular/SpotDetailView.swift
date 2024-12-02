//
//  SpotDetailView.swift
//  Snacktacular
//
//  Created by Max Pintchouk on 11/10/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct SpotDetailView: View {
    @FirestoreQuery(collectionPath: "spots") var fsPhotos: [Photo]
    @State var spot: Spot
    @State private var photoSheetIsPresented = false
    @State private var showingAlert = false
    @State private var alertMessage = "Cannot add a photo until you save a spot"
    @Environment(\.dismiss) private var dismiss
    
    private var photos: [Photo] {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return [Photo.preview, Photo.preview, Photo.preview, Photo.preview, Photo.preview, Photo.preview]
        }
        return fsPhotos
    }
    
    var body: some View {
        VStack {
            Group {
                TextField("name", text: $spot.name)
                    .font(.title)
                    .autocorrectionDisabled()
                TextField("address", text: $spot.address)
                    .font(.title2)
                    .autocorrectionDisabled()
            }
            .textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.5), lineWidth: 2)
                
            }
            .padding(.horizontal)
            
            Button {
                if spot.id == nil {
                    showingAlert.toggle()
                } else {
                    photoSheetIsPresented.toggle()
                }
            } label: {
                Image(systemName: "camera.fill")
                Text("Photo")
            }
            .bold()
            .buttonStyle(.borderedProminent)
            .tint(.snack)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(photos) { photo in
                        let url = URL(string: photo.imageURLString)
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
            .frame(height: 80)
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .task {
            $fsPhotos.path = "spots/\(spot.id ?? "")/photos"
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("submit") {
                    saveSpot()
                    dismiss()
                }
            }
        }
        .alert(alertMessage, isPresented: $showingAlert) {
            Button("Save") {
                // return spot ID after saving new spot
                Task {
                    guard let id = await SpotViewModel.saveSpot(spot: spot) else {
                        print("ERROR SAVING SPOT")
                        return
                    }
                    spot.id = id
                    print(id)
                    photoSheetIsPresented.toggle()
                }
            }
            Button("Cancel", role: .cancel) {}
        }
        .fullScreenCover(isPresented: $photoSheetIsPresented) {
            PhotoView(spot: spot)
        }
    }
    
    func saveSpot() {
        Task {
            guard let id = await SpotViewModel.saveSpot(spot: spot) else {
                print("Error saving")
                return
            }
            print(id)
        }
    }
    
}

#Preview {
    NavigationStack {
        SpotDetailView(spot: Spot.preview)
    }
}
