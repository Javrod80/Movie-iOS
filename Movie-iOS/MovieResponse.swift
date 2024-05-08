//
//  MovieResponse.swift
//  Movie-iOS
//
//  Created by Mañanas on 8/5/24.
//

import Foundation


import Foundation


struct Movies: Decodable {
    let title: String
    let year: String
    let imdbID: String
    let poster: String
    let director: String?
    let sipnosis: String?
    let duracion: String?
    let genero : String?
    let pais : String?
    
    
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case imdbID
        case director = "Director"
        case sipnosis = "Plot"
        case duracion = "Runtime"
        case genero = " Genre"
        case pais = "Country"
        
        
    }
}




struct MovieResponse: Decodable {
    let movies: [Movies]
    
   
     private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

    
    
    






    

