//
//  Tab.swift
//  DesignCodeiOS15
//
//  Created by Hope on 2022/01/08.
//

import SwiftUI

struct TabItem: Identifiable {
    var id: UUID = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(text: "Learn Now", icon: "house", tab: .HOME),
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .EXPLORE),
    TabItem(text: "Notifications", icon: "bell", tab: .NOTIFICATIONS),
    TabItem(text: "Library", icon: "rectangle.stack", tab: .LIBRARY),
]

enum Tab: String {
    case HOME
    case EXPLORE
    case NOTIFICATIONS
    case LIBRARY
}
