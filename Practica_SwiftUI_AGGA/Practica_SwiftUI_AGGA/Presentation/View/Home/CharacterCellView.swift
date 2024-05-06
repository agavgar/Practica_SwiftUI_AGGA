//
//  CharacterCellView.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 29/4/24.
//

import SwiftUI

struct CharacterCellView: View {
    let character: Character
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(character.thumbnail.path)/landscape_xlarge.jpg")) { image in
                image.resizable()
                    .scaledToFill()
                #if os(watchOS)
                    .frame(width: 200,height: 200)
                #else
                    .frame(width: 350, height: 250)
                #endif
                
            } placeholder: {
                Image("Placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
            }.id(1)
            #if os(watchOS)
            Rectangle()
                .fill(Color.red)
                .frame(width: 300, height: 50)
                .offset(y:100)
            Text(character.name)
                .font(.title3)
                .foregroundStyle(.white)
                .backgroundStyle(.clear)
                .bold()
                .frame(width: 500, height: 25)
                .offset(y:90)
                .id(2)
            #else
            ZStack{
                BlurView(style: .dark)
                    .frame(height: 25)
                Text(character.name)
                    .font(.title3)
                    .foregroundStyle(.red)
                    .bold()
                    .id(3)
            }
            .offset(y:125)
            #endif
        }
        #if os(watchOS)
        .frame(width: 350,height: 350)
        #else
        .frame(width: 350, height: 250)
        #endif
        .padding()
        .clipped()
    }
}

#Preview {
    CharacterCellView(character: Character(id: 1, name: "Spiderman", description: "Antes de ser mordido por una araña radioactiva y convertirse en Spider-Man,Peter Parker era un chico normal de la escuela.Era tímido y,a menudo,acosado en la escuela y no sabía como defenderse. Tan pronto como obtuvo sus poderes ganó más confianza en sí mismo y,a veces,hacía bromas,incluso en situaciones peligrosas,siendo particularmente conocido por burlarse de sus enemigos.Cuando su tío murió,Peter decidió ser más responsables por el bien de los demás y aparenta ser duro,pero en realidad es muy compasivo.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16")))
}
