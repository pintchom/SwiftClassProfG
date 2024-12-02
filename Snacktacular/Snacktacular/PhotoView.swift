//
//  PhotoView.swift
//  Snacktacular
//
//  Created by Max Pintchouk on 12/1/24.
//

import SwiftUI
import PhotosUI

struct PhotoView: View {
    @State var spot: Spot
    @State private var photo = Photo()
    @State private var data = Data()
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var pickerIsPresented = true 
    @State private var selectedImage = Image(systemName: "photo")
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            Spacer()
            selectedImage
                .resizable()
                .scaledToFit()
            Spacer()
            Text("by: \(photo.reviewer), on: \(photo.postedOn.formatted(date: .numeric, time: .omitted))")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save") {
                            
                            Task {
                                await PhotoViewModel.saveImage(spot: spot, photo: photo, data: data)
                                dismiss()
                            }
                        }
                    }
                }
                .photosPicker(isPresented: $pickerIsPresented, selection: $selectedPhoto)
                .onChange(of: selectedPhoto) {
                    Task {
                        do {
                            if let image = try await selectedPhoto?.loadTransferable(type: Image.self) {
                                selectedImage = image
                            }
                            guard let transferredData = try await selectedPhoto?.loadTransferable(type: Data.self) else {
                                print("Could not convert data from selected photo")
                                return
                            }
                            data = transferredData
                        } catch {
                            print("ERROR")
                        }
                    }
                }
        }
        .padding()
    }
}

#Preview {
    PhotoView(spot: Spot())
}
