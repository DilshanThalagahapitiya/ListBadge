//
//  ListBadgeVM.swift
//  NewOptions
//
//  Created by Dilshan Thalagahapitiya on 2025-03-07.
//

import Foundation

class ListBadgeVM: ObservableObject {
    @Published var badgeCount: Int = 5
    @Published var newBadgeCount: Int = 0

    @Published var isExpanded: Bool = false
}
