//
//  Sport.swift
//  Workouts
//
//  Created by than.duc.huy on 05/05/2021.
//

import Foundation
import SwiftUI

struct Sport: Identifiable, Hashable {
    var id: Int
    var image: String
    var progress: Int
    var offset = CGFloat.random(in: -30...30)
}
