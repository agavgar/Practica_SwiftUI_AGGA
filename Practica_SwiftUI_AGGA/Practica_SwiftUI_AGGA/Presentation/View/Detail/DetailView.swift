//
//  DetailView.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 4/5/24.
//

import SwiftUI

struct DetailView: View {
    let character: Character
    var series: [Series] = getTestData()
    
    var body: some View {
        NavigationStack {
        #if os(watchOS)
            ZStack{
                    AsyncImage(url: URL(string: "\(character.thumbnail?.path)\(character.thumbnail?.thumbnailExtension)")) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        Image("Placeholder")
                            .resizable()
                            .scaledToFill()
                    }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20) {
                        ForEach(series) { serie in
                            NavigationLink {
                                //Añadir la vista detalle
                                SeriesDetailView(serie: serie)
                            } label: {
                                AsyncImage(url: URL(string: "\(serie.thumbnail?.path)\(serie.thumbnail?.thumbnailExtension)")) { image in
                                    image.resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    Image("Placeholder")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                        }
                    }
                }
                .frame(height: 75)
                .offset(y:60)
            }
        #else
            VStack{
                ZStack{
                    AsyncImage(url: URL(string: "\(character.thumbnail?.path)\(character.thumbnail?.thumbnailExtension)")) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        Image("Placeholder")
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(height: 100)
                    Rectangle()
                        .foregroundColor(.red.opacity(0.55))
                        .frame(height: 100)
                        .offset(y: 170)
                    
                    AsyncImage(url: URL(string: "\(character.thumbnail?.path)\(character.thumbnail?.thumbnailExtension)")) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        Image("Placeholder")
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.65)
                    
                    BlurView(style: .dark)
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                        .offset(y: 170)
                    Rectangle()
                        .foregroundColor(.red.opacity(0.55))
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                        .offset(y: 170)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        Text(character.description!)
                            .font(.body)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 400)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    .offset(y: 200)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20) {
                        ForEach(series) { serie in
                            NavigationLink {
                                //Añadir la vista detalle
                                SeriesDetailView(serie: serie)
                            } label: {
                                AsyncImage(url: URL(string: "\(serie.thumbnail?.path)\(serie.thumbnail?.thumbnailExtension)")) { image in
                                    image.resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    Image("Placeholder")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 100)
            }
            
            .navigationTitle("\(character.name)")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
        #endif
        }
    }
}

func getTestData() -> [Series] {
    return [
        Series(id: 1, name: "Spider-Verse Chronicles", description: "Explore the multiple dimensions of the Spider-Verse, where different versions of Spider-Men and Spider-Women battle against unique villains.", thumbnail: Thumbnail(path: "https://example.com/spiderverse", thumbnailExtension: "jpg")),
        Series(id: 2, name: "Assemble: New York", description: "A new team of Avengers forms in New York City to take on emerging threats from both Earth and the cosmos.", thumbnail: Thumbnail(path: "https://example.com/assembleNY", thumbnailExtension: "jpg")),
        Series(id: 3, name: "Guardians: Galaxy Patrol", description: "Follow the Guardians of the Galaxy in their humorous adventures across the universe as they fight to keep cosmic peace.", thumbnail: Thumbnail(path: "https://example.com/galaxypatrol", thumbnailExtension: "jpg")),
        Series(id: 4, name: "Mystic Arts", description: "Doctor Strange mentors a group of young sorcerers who must protect the Earth from mystical threats.", thumbnail: Thumbnail(path: "https://example.com/mysticarts", thumbnailExtension: "jpg")),
        Series(id: 5, name: "Inhuman Dynasty", description: "Dive into the politics and power struggles of the Inhuman Royal Family in their city on the Moon.", thumbnail: Thumbnail(path: "https://example.com/inhumandynasty", thumbnailExtension: "jpg")),
        Series(id: 6, name: "Shadowland", description: "Daredevil's alter-ego, the Kingpin of Hell's Kitchen, navigates alliances and conflicts among Marvel's street-level heroes and villains.", thumbnail: Thumbnail(path: "https://example.com/shadowland", thumbnailExtension: "jpg")),
        Series(id: 7, name: "The Thunderbolts", description: "A team of reformed villains undertakes government missions in hopes of redemption under the watchful eye of General Ross.", thumbnail: Thumbnail(path: "https://example.com/thunderbolts", thumbnailExtension: "jpg")),
        Series(id: 8, name: "Wakanda Forever", description: "Explore the adventures of the Black Panther as Wakanda faces new technological and political challenges.", thumbnail: Thumbnail(path: "https://example.com/wakandaforever", thumbnailExtension: "jpg")),
        Series(id: 9, name: "Loki: Time Twister", description: "Loki navigates the complexities of time travel to rewrite his past and reshape his destiny, often with unintended consequences.", thumbnail: Thumbnail(path: "https://example.com/lokitime", thumbnailExtension: "jpg")),
        Series(id: 10, name: "Young Avengers", description: "The next generation of Avengers must find their place in a world that has outgrown its heroes, proving themselves worthy of the mantle.", thumbnail: Thumbnail(path: "https://example.com/youngavengers", thumbnailExtension: "jpg"))
    ]
}

#Preview {
    DetailView(character: Character(id: 1, name: "Nighthawk", description: "Antes de convertirse en Nighthawk, Jason Hart era un ingeniero aeronáutico con una vida bastante normal. Tras un accidente en un laboratorio secreto, Jason adquirió habilidades sobrehumanas y decidió usarlas para combatir el crimen en su ciudad, usando su ingenio y habilidades técnicas para diseñar su equipo y trajes.", thumbnail: Thumbnail(path: "https://example.com/nighthawk", thumbnailExtension: "jpg")),
               series: [
                Series(id: 1, name: "Spider-Verse Chronicles", description: "Explore the multiple dimensions of the Spider-Verse, where different versions of Spider-Men and Spider-Women battle against unique villains.", thumbnail: Thumbnail(path: "https://example.com/spiderverse", thumbnailExtension: "jpg")),
                Series(id: 2, name: "Assemble: New York", description: "A new team of Avengers forms in New York City to take on emerging threats from both Earth and the cosmos.", thumbnail: Thumbnail(path: "https://example.com/assembleNY", thumbnailExtension: "jpg")),
                Series(id: 3, name: "Guardians: Galaxy Patrol", description: "Follow the Guardians of the Galaxy in their humorous adventures across the universe as they fight to keep cosmic peace.", thumbnail: Thumbnail(path: "https://example.com/galaxypatrol", thumbnailExtension: "jpg")),
                Series(id: 4, name: "Mystic Arts", description: "Doctor Strange mentors a group of young sorcerers who must protect the Earth from mystical threats.", thumbnail: Thumbnail(path: "https://example.com/mysticarts", thumbnailExtension: "jpg")),
                Series(id: 5, name: "Inhuman Dynasty", description: "Dive into the politics and power struggles of the Inhuman Royal Family in their city on the Moon.", thumbnail: Thumbnail(path: "https://example.com/inhumandynasty", thumbnailExtension: "jpg")),
                Series(id: 6, name: "Shadowland", description: "Daredevil's alter-ego, the Kingpin of Hell's Kitchen, navigates alliances and conflicts among Marvel's street-level heroes and villains.", thumbnail: Thumbnail(path: "https://example.com/shadowland", thumbnailExtension: "jpg")),
                Series(id: 7, name: "The Thunderbolts", description: "A team of reformed villains undertakes government missions in hopes of redemption under the watchful eye of General Ross.", thumbnail: Thumbnail(path: "https://example.com/thunderbolts", thumbnailExtension: "jpg")),
                Series(id: 8, name: "Wakanda Forever", description: "Explore the adventures of the Black Panther as Wakanda faces new technological and political challenges.", thumbnail: Thumbnail(path: "https://example.com/wakandaforever", thumbnailExtension: "jpg")),
                Series(id: 9, name: "Loki: Time Twister", description: "Loki navigates the complexities of time travel to rewrite his past and reshape his destiny, often with unintended consequences.", thumbnail: Thumbnail(path: "https://example.com/lokitime", thumbnailExtension: "jpg")),
                Series(id: 10, name: "Young Avengers", description: "The next generation of Avengers must find their place in a world that has outgrown its heroes, proving themselves worthy of the mantle.", thumbnail: Thumbnail(path: "https://example.com/youngavengers", thumbnailExtension: "jpg"))
               ])
}
