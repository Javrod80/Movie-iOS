//
//  MovieCall.swift
//  Movie-iOS
//
//  Created by Mañanas on 8/5/24.
//

import Foundation

class MovieProvider {
    
    static func getMovieFromApi(query: String) async throws -> [Movies] {
        guard let url = URL(string: "http://www.omdbapi.com/?apikey=b9856625&s=\(query)") else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        print (url.absoluteString)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print (data.description)
            let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
            return decoded.movies
            
            
            
            
        } catch {
            
            print("Error al obtener datos de la API: \(error)")
        }
        return []
        
    }
    
    static func getMovieDetailFromApi(query: String) async throws -> Movies? {
        guard let url = URL(string: "http://www.omdbapi.com/?apikey=b9856625&i=\(query)") else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        print (url.absoluteString)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print (data.description)
            let decoded = try JSONDecoder().decode(Movies.self, from: data)
            return decoded
            
            
            
            
        } catch {
            
            print("Error al obtener datos de la API: \(error)")
        }
        return nil
        
    }
}

