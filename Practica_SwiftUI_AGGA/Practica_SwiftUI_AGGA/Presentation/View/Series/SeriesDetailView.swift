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
        Text(serie.name)
            .font(.caption2)
            .foregroundStyle(.white)
            .backgroundStyle(.clear)
            .bold()
            .frame(width: 500, height: 25)
            .offset(y:90)
    }
    #else
        NavigationStack {
            ZStack{
                AsyncImage(url: URL(string: "\(serie.thumbnail.path)")) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Image("Placeholder")
                        .resizable()
                        .scaledToFill()
                }
    
                BlurView(style: .dark)
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .offset(y: 300)
                Rectangle()
                    .foregroundColor(.red.opacity(0.55))
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .offset(y: 300)
                
                ScrollView(.vertical, showsIndicators: false){
                    Text(serie.description)
                        .font(.body)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 400)
                }
                .frame(height: UIScreen.main.bounds.height * 0.25)
                .offset(y: 300)
            }
            .navigationTitle("\(serie.name)")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
        }
        #endif
    }
}

#Preview {
    SeriesDetailView(serie: Series(id: 1, name: "Spider-Verse Chronicles", description: "Explore the multiple dimensions of the Spider-Verse, where different versions of Spider-Men and Spider-Women battle against unique villains.", thumbnail: Thumbnail(path: "https://example.com/spiderverse")))
}
