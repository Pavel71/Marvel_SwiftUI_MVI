//
//  CharactersAction.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI


enum CharacterAction: InputActionable {
    case query(str: String)
    case showAlertAction
    case pushScreen
    case loadContent
    case showEmpty
}
