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
        #if os(watchOS)
            ZStack{
                AsyncImage(url: URL(string: "\(character.thumbnail?.path)\(character.thumbnail?.thumbnailExtension)")) { image in
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
                Text(character.name!)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .backgroundStyle(.clear)
                    .bold()
                    .frame(width: 500, height: 25)
                    .offset(y:90)
            }
        #else
        Spacer()
        VStack{
            AsyncImage(url: URL(string: "\(character.thumbnail?.path)\(character.thumbnail?.thumbnailExtension)")) { image in
                image.resizable()
                    .frame(width: 350, height: 250)
                    .scaledToFill()
                    
            } placeholder: {
                Image("Placeholder")
                    .resizable()
                    .scaledToFill()
                    .offset(x: 20,y:100)
                    .frame(width: 350, height: 250)
            }
            ZStack{
                BlurView(style: .dark)
                    .frame(width: 500, height: 25)
                Text(character.name!)
                    .font(.title3)
                    .foregroundStyle(.red)
                    .bold()
            }
            .offset(y:12)
        }
        #endif
    }
}

#Preview {
    CharacterCellView(character: Character(id: 1, name: "Spiderman", description: "Antes de ser mordido por una araña radioactiva y convertirse en Spider-Man,Peter Parker era un chico normal de la escuela.Era tímido y,a menudo,acosado en la escuela y no sabía como defenderse. Tan pronto como obtuvo sus poderes ganó más confianza en sí mismo y,a veces,hacía bromas,incluso en situaciones peligrosas,siendo particularmente conocido por burlarse de sus enemigos.Cuando su tío murió,Peter decidió ser más responsables por el bien de los demás y aparenta ser duro,pero en realidad es muy compasivo.", thumbnail: Thumbnail(path: "https://ultimatespiderman.fandom.com/es/wiki/Spider-Man?file=Spider-Man.", thumbnailExtension: "png")))
        .previewLayout(.fixed(width: 400.0, height: 200.0))
}
