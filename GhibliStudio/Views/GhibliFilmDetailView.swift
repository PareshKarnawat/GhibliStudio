//
//  GhibliFilmDetailView.swift
//  GhibliStudio
//
//  Created by Paresh Karnawat on 06/07/25.
//

import SwiftUI

struct GhibliFilmDetailView: View {
    let film: GhibliFlim
    
    var body: some View {
        ZStack {
            Color(.systemCyan)
                    .ignoresSafeArea()
            VStack {
                AsyncImage(url: URL(string: film.movie_banner)) {
                    phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    default:
                        Image(systemName: "photo")
                    }
                }
                .padding()
                Text(film.title)
                    .font(.largeTitle)
                    .padding()
                Text("Original Title: \(film.original_title)")
                    .font(.caption)
                Text(film.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground)))
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            .padding()
        }
    }
}

#Preview {
    GhibliFilmDetailView(film: GhibliFlim(
        id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
        title: "Castle in the Sky",
        original_title: "天空の城ラピュタ",
        image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
        movie_banner: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
        description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa...",
        director: "Hayao Miyazaki",
        producer: "Isao Takahata",
        release_date: "1986",
        running_time: "https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe",
        url: "124",
    ))
}
