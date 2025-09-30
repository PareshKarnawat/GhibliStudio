//
//  GhibliNetworkService.swift
//  GhibliStudio
//
//  Created by Paresh Karnawat on 06/07/25.
//
import Foundation

struct GhibliNetworkService: GhibliNetworkServiceProtocol {
   
    func fetchGhibliFilmList(_ urlString: String) async throws -> [GhibliFlim] {
        guard let url = URL(string: urlString) else
        {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard !data.isEmpty else {
                throw NetworkError.noData
            }
            let response = try JSONDecoder().decode([GhibliFlim].self, from: data)
            print(response)
            return response
        } catch let decodingError as DecodingError {
            throw NetworkError.decodingError(decodingError)
        } catch {
            throw NetworkError.networkError(error)
        }
        
    }
}
