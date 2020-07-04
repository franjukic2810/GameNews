//
//  UpdateStore.swift
//  GameNews
//
//  Created by Fran Jukic on 31/03/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

