//
//  ViewAlertInfo.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 25.01.2022.
//

import Foundation


struct AlertInfo: Identifiable {
    var id = UUID()
    var title: String = ""
    var message: String = ""
    var code: Int? = nil
}
