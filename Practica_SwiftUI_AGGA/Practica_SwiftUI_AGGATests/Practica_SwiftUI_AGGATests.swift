//
//  Practica_SwiftUI_AGGATests.swift
//  Practica_SwiftUI_AGGATests
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import XCTest
import SwiftUI
@testable import Practica_SwiftUI_AGGA

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
    
    func testHomeView() {
        let home = Home()
        XCTAssertNotNil(home)
    }
    
    func testSeriesDetailView() {
        let sdv = SeriesDetailView(serie: Series(id: 1, title: "", thumbnail: Thumbnail(path: "")))
        XCTAssertNotNil(sdv)
    }
    
    func testDetailView() {
        let viewModel = CharacterViewModel(repo: CharacterRepositoryFake(Network: CharacterNetworkFake()))
        XCTAssertNotNil(viewModel)
        
        let dv = DetailView(character: Character(id: 1, name: "", description: "", thumbnail: Thumbnail(path: "")))
        XCTAssertNotNil(dv)
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
