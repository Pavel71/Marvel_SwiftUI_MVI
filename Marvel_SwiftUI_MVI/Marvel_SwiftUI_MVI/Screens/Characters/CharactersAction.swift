//
//  CharactersAction.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI

extension CharactersScreenView {
    enum ViewAction: InputActionable {
        case query(str: String)
        case showAlertAction
        case pushScreen
        case loadContent
        case showEmpty
    }
}

