//
//  ComponentSettingValues.swift
//  DiagramForThesis
//
//  Created by オナガ・ハルキ on 2023/01/24.
//

import Foundation

struct ComponentSettingValues {
    static let minWidth: Double = 800
    
    static let fontSize: CGFloat = 50
    static let itemHeight: CGFloat = 90
    static let borderWidth: CGFloat = 5
    
    static let connectionWidth: CGFloat = 400
    static let connectionHeight: CGFloat = 90
    
    static let arrowTerminalWidth: CGFloat = 15
    static let arrowTerminalHeight: CGFloat = 30
    static var oneVerticalLineWithoutArrow: CGFloat {
        (self.itemHeight - self.arrowTerminalHeight)/2
    }
    
    static let bottomPaddingForLastText: CGFloat = 30
    static let textLeadingPadding: CGFloat = 30
    static let textTrailPadding: CGFloat = 100
    
    // HeaderComponent
    static let indexWidth: CGFloat = 300
    static var headerItemHeight: CGFloat {
        self.itemHeight*2 + self.bottomPaddingForLastText
    }
    
    // NestComponent
    static let nestComponentScale: Double = 0.85
    static let nestTopPaddingWithConnectionHeight: CGFloat = 150
    static let nestBottomPadding: CGFloat = 90
    
    // Extension
    static let extensionOutsidePadding: CGFloat = 90
    static let extensionTopPadding: CGFloat = 180
    static let extensionBottomPadding: CGFloat = 180
    
    // Struct
    static let protocolIndent: CGFloat = 1000
    static let structIndent: CGFloat = 0
    static let classIndent: CGFloat = 1500
    static let enumIndent: CGFloat = 700
}
