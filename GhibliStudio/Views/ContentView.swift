//
//  ContentView.swift
//  GhibliStudio
//
//  Created by Paresh Karnawat on 06/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var ghibliViewModel = GhibliViewModel()
    @State private var selectedFilm : GhibliFlim?
    @State private var isShowingError = false
    
    var body: some View {
        NavigationStack {
            List(ghibliViewModel.ghibliFilms){
                film in
                GhibliFilmCellView(film: film)
                    .onTapGesture {
                        selectedFilm = film
                    }
            }
            .navigationTitle("Ghibli Studio App")
            .navigationDestination(item:$selectedFilm) {
                film in
                GhibliFilmDetailView(film: film)
            }
        }
        .task {
            await ghibliViewModel.loadGhibliFilms()
            if ghibliViewModel.errorMessage != nil {
                isShowingError = true
            }
        }
        .alert("Error", isPresented: $isShowingError,actions: {
            Button("Ok", role: .cancel) {}
        }, message: {
            Text(ghibliViewModel.errorMessage ?? "Unknown error")
        })
    }
}

#Preview {
    ContentView()
}
