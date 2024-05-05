//
//  Home.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 29/4/24.
//

import SwiftUI

struct Home: View {
    //var characters: [Character] = getTestData()
    @EnvironmentObject var viewModel: CharacterViewModel
    
    var body: some View {
        #if os(watchOS)
        NavigationStack {
            List{
                ForEach(viewModel.characters) { character in
                    NavigationLink {
                        //Añadir la vista detalle
                        DetailView(viewModel: viewModel, character: character)
                    } label: {
                        CharacterCellView(character: character)
                            .frame(width: 175, height: 175)
                    }
                }
            }
        }
        #else
        NavigationStack {
            List{
                ForEach(viewModel.characters) { character in
                    NavigationLink {
                        //Añadir la vista detalle
                        DetailView(viewModel: viewModel, character: character)
                    } label: {
                        CharacterCellView(character: character)
                    }
                }
            }
            .navigationTitle("Characters")
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

func getTestData() -> [Character] {
    return [
    Character(id: 1, name: "Nighthawk", description: "Antes de convertirse en Nighthawk, Jason Hart era un ingeniero aeronáutico con una vida bastante normal. Tras un accidente en un laboratorio secreto, Jason adquirió habilidades sobrehumanas y decidió usarlas para combatir el crimen en su ciudad, usando su ingenio y habilidades técnicas para diseñar su equipo y trajes.", thumbnail: Thumbnail(path: "https://example.com/nighthawk")),
        Character(id: 2, name: "Mystica", description: "Mystica nació con la habilidad de alterar su forma y apariencia a voluntad. A lo largo de los años, utilizó sus habilidades para infiltrarse en organizaciones criminales y desmantelarlas desde dentro. A pesar de su exterior frío y calculador, en el fondo, Mystica busca justicia y protección para los inocentes.", thumbnail: Thumbnail(path: "https://example.com/mystica")),
        Character(id: 3, name: "Quantum", description: "Quantum es un físico que descubrió una forma de manipular las leyes de la física a su antojo. Con un profundo sentido de responsabilidad, usa sus poderes para proteger el mundo de amenazas que desafían la realidad convencional. A menudo se le encuentra en el centro de eventos cósmicos, intentando equilibrar las fuerzas del universo.", thumbnail: Thumbnail(path: "https://example.com/quantum")),
        Character(id: 4, name: "Spectra", description: "Después de un encuentro cercano con un fenómeno astronómico, Clara Ray adquirió la habilidad de manipular la luz y la energía. Como Spectra, ella usa estas habilidades para luchar contra el crimen y iluminar las sombras donde se esconden los criminales. Su personalidad brillante y optimista la hace una heroína amada por muchos.", thumbnail: Thumbnail(path: "https://example.com/spectra")),
        Character(id: 5, name: "Vortex", description: "Vortex tiene el poder de crear y controlar vientos a niveles catastróficos. Inicialmente usó su poder para fines personales, pero después de presenciar la destrucción que puede causar, decidió utilizar sus habilidades para ayudar a las personas en desastres naturales. A pesar de su poderosa presencia, Vortex es muy reflexivo y calmado.", thumbnail: Thumbnail(path: "https://example.com/vortex")),
        Character(id: 6, name: "Echo", description: "Echo tiene la habilidad única de replicar cualquier sonido o voz que escuche. Utilizando esta habilidad, se convirtió en una experta en infiltración y espionaje. Aunque al principio luchó con la moralidad de sus acciones, finalmente encontró un propósito en usar sus habilidades para exponer verdades ocultas y proteger a los inocentes.", thumbnail: Thumbnail(path: "https://example.com/echo")),
        Character(id: 7, name: "Blaze", description: "Blaze descubrió su habilidad para manipular el fuego después de sobrevivir a un incendio forestal devastador. Usando su poder para tanto crear como extinguir llamas, lucha para mantener el equilibrio en su vida mientras usa sus habilidades en la lucha contra el crimen. Su pasión ardiente por la justicia lo convierte en un aliado valioso y un enemigo formidable.", thumbnail: Thumbnail(path: "https://example.com/blaze")),
        Character(id: 8, name: "Tempest", description: "Tempest puede controlar el clima y usa sus poderes para proteger la Tierra de desastres naturales y enemigos que quieran explotar o dañar el medio ambiente. Aunque es temida por su poder, es profundamente respetada por su firme compromiso con la preservación del planeta y su ecosistema.", thumbnail: Thumbnail(path: "https://example.com/tempest"))
    ]
}

#Preview {
    Home()
        .environmentObject(CharacterViewModel())
}
