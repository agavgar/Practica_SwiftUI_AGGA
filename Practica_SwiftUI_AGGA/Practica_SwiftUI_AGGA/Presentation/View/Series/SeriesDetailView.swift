//
//  SeriesDetailView.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 4/5/24.
//

import SwiftUI

struct SeriesDetailView: View {
    let serie: Series
    
    var body: some View {
        NavigationStack {
            ZStack{
                AsyncImage(url: URL(string: "\(serie.thumbnail.path)/portrait_incredible.jpg")) { image in
                    image.resizable()
                        .scaledToFill()
                        .clipped()
                } placeholder: {
                    Image("Placeholder")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                }
                #if os(watchOS)
                .frame(height: 200)
                #else
                .frame(height: 350)
                #endif
            }
            .navigationTitle("\(serie.title)")
            #if os(iOS)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                }
            }
            #endif
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    SeriesDetailView(serie: Series(id: 1, title: "Spider-Verse Chronicles",  thumbnail: Thumbnail(path: "https://example.com/spiderverse")))
}
