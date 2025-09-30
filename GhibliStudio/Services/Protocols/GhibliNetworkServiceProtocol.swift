//
//  GbibliNetworkServiceProtocol.swift
//  GhibliStudio
//
//  Created by Paresh Karnawat on 06/07/25.
//

protocol GhibliNetworkServiceProtocol {
    func fetchGhibliFilmList(_ url: String) async throws -> [GhibliFlim]
}
