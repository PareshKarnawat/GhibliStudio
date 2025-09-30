//
//  GhibliViewModel.swift
//  GhibliStudio
//
//  Created by Paresh Karnawat on 06/07/25.
//
import Foundation

@MainActor
class GhibliViewModel:ObservableObject {
    @Published var ghibliFilms : [GhibliFlim] = []
    private let baseURL = "https://ghibliapi.vercel.app"
    private var ghibliNetworkService : GhibliNetworkServiceProtocol
    @Published var errorMessage : String?
    
    init(ghibliNetworkService: GhibliNetworkServiceProtocol = GhibliNetworkService()) {
        self.ghibliNetworkService = ghibliNetworkService
    }
    
    func loadGhibliFilms() async {
        let ghibliFilmListURLString = "\(baseURL)/films"
        do{
            self.ghibliFilms = try await ghibliNetworkService.fetchGhibliFilmList(ghibliFilmListURLString)
        } catch let error as NetworkError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = "Unexpected error: \(error.localizedDescription)"
        }
    }
}
