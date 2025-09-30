//
//  GhibliFlimList.swift
//  GhibliStudio
//
//  Created by Paresh Karnawat on 06/07/25.
//
import Foundation

struct GhibliFlim: Codable, Identifiable, Hashable {
    let id : String
    let title: String
    let original_title: String
    let image: String
    let movie_banner: String
    let description: String
    let director: String
    let producer: String
    let release_date: String
    let running_time: String
    let url: String
}

