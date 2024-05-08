//
//  DetailViewController.swift
//  Movie-iOS
//
//  Created by Mañanas on 8/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movies: Movies? = nil
    
    
    
    @IBOutlet var movieImage: UIImageView!
    
    @IBOutlet var nameMovie: UILabel!
    
    @IBOutlet var yearMovie: UILabel!
    
    @IBOutlet var plotMovie: UILabel!
    
    @IBOutlet var runtimeMovie: UILabel!
    
    @IBOutlet var directorMovie: UILabel!
    
    @IBOutlet var genreMovie: UILabel!
    
    
    @IBOutlet var countryMovie: UILabel!
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        movieImage.loadImage(fromURL: movies!.poster)
        nameMovie.text = movies!.title
        yearMovie.text = movies!.year
       /* plotMovie.text = movies!.sipnosis
        runtimeMovie.text = movies!.duracion
        directorMovie.text = movies!.director
        genreMovie.text = movies!.genero
        countryMovie.text = movies!.pais*/
        
        
        Task.init {
            await fetchMovies()
        }
        
    }
    
    func fetchMovies() async {
        
        
        do {
            movies = try await MovieProvider.getMovieDetailFromApi(query: movies!.imdbID)
            print(movies)
            
            
            DispatchQueue.main.async {
                self.plotMovie.text = self.movies!.sipnosis
                self.runtimeMovie.text = self.movies!.duracion
                self.directorMovie.text = self.movies!.director
                self.genreMovie.text = self.movies!.genero
                self.countryMovie.text = self.movies!.pais
            }
        } catch {
            print("Error al obtener movies: \(error)")
        }
        print ("fin")
    
        
    
    }
    
}
