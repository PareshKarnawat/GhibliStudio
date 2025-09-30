//
//  GhibliFilmCellView.swift
//  GhibliStudio
//
//  Created by Paresh Karnawat on 06/07/25.
//

import SwiftUI

struct GhibliFilmCellView: View {
    let film : GhibliFlim
    @State var uiImage : UIImage? = nil
    
    var body: some View {
        HStack {
            if let image = uiImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
            } else {
                Image(systemName: "photo")
            }
//            AsyncImage(url: URL(string: film.image)) {
//                phase in
//                switch phase {
//                case .success(let image):
//                    image.resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 100, height: 150)
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .clipped()
//                        .shadow(radius: 4)
//                case .empty:
//                    ProgressView()
//                default:
//                    Image(systemName: "photo")
//                }
//            }
            VStack (alignment: .leading){
                Text(film.title)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(film.description)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
        .task {
            if let imageURL = URL(string: film.image) {
                uiImage = await loadImage(from: imageURL)
            }
        }
        .padding()
    }
}

#Preview {
    GhibliFilmCellView(film: GhibliFlim(
        id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
        title: "Castle in the Sky",
        original_title: "天空の城ラピュタ",
        image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
        movie_banner: "https://image.tmb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
        description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa...",
        director: "Hayao Miyazaki",
        producer: "Isao Takahata",
        release_date: "1986",
        running_time: "https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe",
        url: "124"))
}
