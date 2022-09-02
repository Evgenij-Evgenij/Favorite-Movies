//
//  Model.swift
//  Favorite Movies
//
//  Created by Евгений Воронов on 01.09.2022.
//

import Foundation
import SwiftUI

struct ModelMovies:Hashable {
   // var id = UUID().uuidString
    var title: String
    var year: Int  
}

class Movies: ObservableObject{
  @Published var movies: [ModelMovies] = []
}

