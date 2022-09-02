//
//  Favorite_MoviesApp.swift
//  Favorite Movies
//
//  Created by Евгений Воронов on 01.09.2022.
//

import SwiftUI

@main
struct Favorite_MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(modelMov: ModelMovies(title: "ascss", year: 32))
        }
    }
}
