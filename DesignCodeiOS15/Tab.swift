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
}

var tabItems = [
    TabItem(text: "Learn Now", icon: "house"),
    TabItem(text: "Explore", icon: "magnifyingglass"),
    TabItem(text: "Notifications", icon: "bell"),
    TabItem(text: "Library", icon: "rectangle.stack"),
]
