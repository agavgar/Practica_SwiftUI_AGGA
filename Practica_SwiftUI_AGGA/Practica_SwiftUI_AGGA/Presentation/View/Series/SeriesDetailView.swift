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
    #if os(watchOS)
    ZStack{
        AsyncImage(url: URL(string: "\(serie.thumbnail.path)")) { image in
            image.resizable()
                .scaledToFill()
                .frame(width: 150,height: 300)
                
        } placeholder: {
            Image("Placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 150,height: 300)
        }
        Rectangle()
            .fill(Color.red)
            .frame(width: 300, height: 50)
            .offset(y:100)
        Text(serie.title)
            .font(.caption2)
            .foregroundStyle(.white)
            .backgroundStyle(.clear)
            .bold()
            .frame(width: 500, height: 25)
            .offset(y:90)
    }
            
    #else
            ZStack{
                AsyncImage(url: URL(string: "\(serie.thumbnail.path)")) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Image("Placeholder")
                        .resizable()
                        .scaledToFill()
                }
                .navigationTitle("\(serie.title)")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 35)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
        #endif
        }
    }
}

#Preview {
    SeriesDetailView(serie: Series(id: 1, title: "Spider-Verse Chronicles",  thumbnail: Thumbnail(path: "https://example.com/spiderverse")))
}
