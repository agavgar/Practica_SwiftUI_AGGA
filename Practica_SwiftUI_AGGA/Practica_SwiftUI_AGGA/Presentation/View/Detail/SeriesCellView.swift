//
//  CharacterCellView.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 29/4/24.
//

import SwiftUI

struct SeriesCellView: View {
    let serie: Series
    
    var body: some View {
#if os(watchOS)
        AsyncImage(url: URL(string: "\(serie.thumbnail.path)/portrait_small.jpg")) { image in
            image.resizable()
                .scaledToFill()
                .frame(width: 150,height: 300)
            
        } placeholder: {
            Image("Placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 150,height: 300)
        }
#else
        AsyncImage(url: URL(string: "\(serie.thumbnail.path)/portrait_medium.jpg")) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            Image("Placeholder")
                .resizable()
                .scaledToFill()
                .clipped()
        }
        .frame(width: 100 ,height: 150)
#endif
    }
}

#Preview {
    SeriesCellView(serie: Series(id: 1, name: "Spider-Verse Chronicles", description: "Explore the multiple dimensions of the Spider-Verse, where different versions of Spider-Men and Spider-Women battle against unique villains.", thumbnail: Thumbnail(path: "https://example.com/spiderverse")))
}
