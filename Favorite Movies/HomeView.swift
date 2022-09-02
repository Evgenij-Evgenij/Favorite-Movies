//
//  HomeView.swift
//  Favorite Movies
//
//  Created by Евгений Воронов on 02.09.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var moviesModel = Movies()
    @State var modelMov: ModelMovies
    @State  private var title = ""
    @State  private var year = ""
    @State  private var isAddedMovie = false
    var body: some View {
        
        VStack(spacing: 20) {
            Section{
                TextField("Movie", text: $title)
                TextField("Year", text: $year)
                    
            }
            .padding(10)
            .background(Color.gray .opacity(0.5))
            .cornerRadius(5)
            
            Button {
                savetoList()
            } label: {
                Text("Save movie")
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color.red.opacity(0.8)))
            }
            .alert(Text("This movie already append"), isPresented: $isAddedMovie) {
                
            }
            
            Section {
                List {
                    ForEach (moviesModel.movies, id: \.self) { movie in
                        HStack {
                            Text(movie.title)
                            Text(String(movie.year))
                        }
                    }
                    .onDelete(perform: dileteItem)
                }
                
            }
        }
        .padding()
    }
    private func savetoList() {
        guard !title.isEmpty && !year.isEmpty else {return}
        if modelMov.title.contains(self.title) && modelMov.year == Int(self.year)  {
            isAddedMovie.toggle()
            print("This movie already append")
        } else {
            modelMov.title = self.title;
            modelMov.year = Int(self.year) ?? 0
            withAnimation {
                moviesModel.movies.insert(modelMov, at: 0)
                self.title = "";
                self.year = ""
            }
            
        }
    }
    private func dileteItem(offsets: IndexSet) {
        moviesModel.movies.remove(atOffsets: offsets)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(modelMov: ModelMovies(title: "wd", year: 23))
    }
}
