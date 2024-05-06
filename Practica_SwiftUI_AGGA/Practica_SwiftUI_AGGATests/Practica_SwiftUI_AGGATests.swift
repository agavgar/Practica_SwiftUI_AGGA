//
//  Practica_SwiftUI_AGGATests.swift
//  Practica_SwiftUI_AGGATests
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Practica_SwiftUI_AGGA

extension CharacterViewModel: Observable {}

final class Practica_SwiftUI_AGGATests: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(1, 1)
    }
    
    func testContentView() {
        let contentView = ContentView()
        XCTAssertNotNil(contentView)
    }
    
    func testCharacterNetwork() async throws {
        let obj1 = CharacterNetwork()
        XCTAssertNotNil(obj1)
    }
    
    func testCharacterNetworkFake() async throws {
        let obj = CharacterNetworkFake()
        XCTAssertNotNil(obj)
    }
    
    func testCharacterRepository() async throws {
        let obj1 = CharacterRepository()
        XCTAssertNotNil(obj1)
    }
    
    func testCharacterRepositoryFake() async throws {
        let obj = CharacterRepositoryFake()
        XCTAssertNotNil(obj)
    }
    
    func testCharacterViewModel() async throws {
        //Caso de uso con repo Fake
        let viewModel = CharacterViewModel(repo: CharacterRepositoryFake(Network: CharacterNetworkFake()))
        XCTAssertNotNil(viewModel)
        
        let resp = await viewModel.getCharacter()
        XCTAssertNotNil(viewModel.characters)
        
        let resp2 = await viewModel.getSeries(id: 1)
        XCTAssertNotNil(viewModel.series)
        
        let resp3 = viewModel.loadCharacters()
        XCTAssertNotNil(viewModel.characters)
        
        let resp4 = viewModel.loadSeries(id: 1)
        XCTAssertNotNil(viewModel.series)
    }
    
    func testCharacterCellView() throws{
        let view = CharacterCellView(character: Character(id: 1, name: "", description: "", thumbnail: Thumbnail(path: "")))
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(image)
        
        #if os(watchOS)
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        #endif
        let text2 = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text2)
    }
    
    func testHomeView() throws {
        let home = Home()
            .environment(CharacterViewModel())
        XCTAssertNotNil(home)
        
        let numItems = try home.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try home.inspect().find(viewWithId: 5)
        XCTAssertNotNil(image)
    }
    
    func testSeriesDetailView() throws {
        let sdv = SeriesDetailView(serie: Series(id: 1, title: "", thumbnail: Thumbnail(path: "")))
        XCTAssertNotNil(sdv)
        
        let numItems = try sdv.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try sdv.inspect().find(viewWithId: 17)
        XCTAssertNotNil(image)
        
        let image2 = try sdv.inspect().find(viewWithId: 18)
        XCTAssertNotNil(image2)
        
        let image3 = try sdv.inspect().find(viewWithId: 19)
        XCTAssertNotNil(image3)
    }
    
    func testDetailView() throws {
        let hero = Character(id: 1, name: "", description: "", thumbnail: Thumbnail(path: ""))
        
        let dv = DetailView(character: hero)
            .environmentObject(CharacterViewModel())
        XCTAssertNotNil(dv)
        
        let numItems = try dv.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try dv.inspect().find(viewWithId: 6)
        XCTAssertNotNil(image)
        
        let image2 = try dv.inspect().find(viewWithId: 7)
        XCTAssertNotNil(image2)
        
        let image3 = try dv.inspect().find(viewWithId: 14)
        XCTAssertNotNil(image3)
        
        #if os(watchOS)
        let image4 = try dv.inspect().find(viewWithId: 15)
        XCTAssertNotNil(image4)
        #endif
        
        let image5 = try dv.inspect().find(viewWithId: 16)
        XCTAssertNotNil(image5)
        #if os(watchOS)
        let text = try dv.inspect().find(viewWithId: 8)
        XCTAssertNotNil(text)
        
        let text2 = try dv.inspect().find(viewWithId: 9)
        XCTAssertNotNil(text2)
        
        let shape = try dv.inspect().find(viewWithId: 10)
        XCTAssertNotNil(shape)
        #endif
        
        if hero.description.count != 0 {
            let text3 = try dv.inspect().find(viewWithId: 11)
            XCTAssertNotNil(text3)
        }else{
            let text4 = try dv.inspect().find(viewWithId: 12)
            XCTAssertNotNil(text4)
        }
    }
    
    func testBlurView() {
        let view = BlurView(style: .dark)
        let view2 = BlurView(style: .light)
        let view3 = BlurView(style: .extraLight)
        let view4 = BlurView(style: .systemMaterialDark)
        
        XCTAssertNotNil(view)
        XCTAssertNotNil(view2)
        XCTAssertNotNil(view3)
        XCTAssertNotNil(view4)
    }
    
    
}
