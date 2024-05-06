//
//  DetailView.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 4/5/24.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: CharacterViewModel
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    AsyncImage(url: URL(string: "\(character.thumbnail.path)/portrait_incredible.jpg")) { image in
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .id(6)
                    } placeholder: {
                        Image("Placeholder")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .id(7)
                    }
                    #if os(watchOS)
                    .frame(height: 150)
                    #else
                    .frame(height: 350)
                    #endif
                    
                    #if os(watchOS)
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 300, height: 50)
                        .offset(y:50)
                    
                    ScrollView(.vertical){
                    if character.description.count != 0 {
                            Text(character.description)
                                .font(.body)
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .offset(y: 120)
                                .id(8)
                        }else{
                            Text("No description")
                                .font(.body)
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 200, height: 80)
                                .offset(y: 160)
                                .id(9)
                        }
                    }
                    #else
                    BlurView(style: .dark)
                        .frame(height: 220)
                        .offset(y: 180)
                    Rectangle()
                        .foregroundColor(.red.opacity(0.55))
                        .frame(height: 220)
                        .offset(y: 180)
                        .id(10)
                    
                    
                    if character.description.count != 0 {
                        Text(character.description)
                            .font(.body)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(height: 350)
                            .offset(y: 160)
                            .id(11)
                    }else{
                        Text("No description")
                            .font(.body)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(height: 350)
                            .offset(y: 160)
                            .id(12)
                    }
                    #endif
                    
                }
                #if os(watchOS)
                .frame(height: 150)
                #else
                .frame(height: UIScreen.main.bounds.height * 0.6)
                #endif
                .clipped()
                
                Spacer()
                
                if viewModel.isLoading{
                    ProgressView().id(13)
                }else{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20) {
                            ForEach(viewModel.series) { serie in
                                NavigationLink {
                                    //Añadir la vista detalle
                                    SeriesDetailView(serie: serie)
                                } label: {
                                    AsyncImage(url: URL(string: "\(serie.thumbnail.path)/portrait_medium.jpg")) { image in
                                        image.resizable()
                                            .scaledToFit()
                                            .id(15)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 90 ,height: 125)
                                }
                            }.id(14)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("\(character.name)")
            #if os(iOS)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                        .id(16)
                }
            }
            #endif
            .navigationBarTitleDisplayMode(.automatic)
            .onAppear {
                viewModel.loadSeries(id: character.id)
                print(viewModel.series)
                print(viewModel.isLoading)
            }
        }
    }
}

func getTestData() -> [Series] {
    return [
        Series(id: 1, title: "Spider-Verse Chronicles", thumbnail: Thumbnail(path: "https://example.com/spiderverse")),
        Series(id: 2, title: "Assemble: New York", thumbnail: Thumbnail(path: "https://example.com/assembleNY")),
        Series(id: 3, title: "Guardians: Galaxy Patrol", thumbnail: Thumbnail(path: "https://example.com/galaxypatrol")),
        Series(id: 4, title: "Mystic Arts", thumbnail: Thumbnail(path: "https://example.com/mysticarts")),
        Series(id: 5, title: "Inhuman Dynasty", thumbnail: Thumbnail(path: "https://example.com/inhumandynasty")),
        Series(id: 6, title: "Shadowland", thumbnail: Thumbnail(path: "https://example.com/shadowland")),
        Series(id: 7, title: "The Thunderbolts", thumbnail: Thumbnail(path: "https://example.com/thunderbolts")),
        Series(id: 8, title: "Wakanda Forever", thumbnail: Thumbnail(path: "https://example.com/wakandaforever")),
        Series(id: 9, title: "Loki: Time Twister", thumbnail: Thumbnail(path: "https://example.com/lokitime")),
        Series(id: 10, title: "Young Avengers", thumbnail: Thumbnail(path: "https://example.com/youngavengers"))
    ]
}

#Preview {
    DetailView(character: Character(id: 1, name: "Nighthawk", description: "Antes de convertirse en Nighthawk, Jason Hart era un ingeniero aeronáutico con una vida bastante normal. Tras un accidente en un laboratorio secreto, Jason adquirió habilidades sobrehumanas y decidió usarlas para combatir el crimen en su ciudad, usando su ingenio y habilidades técnicas para diseñar su equipo y trajes.", thumbnail: Thumbnail(path: "https://example.com/nighthawk")))
        .environmentObject(CharacterViewModel())
}

/*
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
 */

