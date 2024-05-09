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
    
    
    
    @IBOutlet var primerView: UIView!
    
    
    @IBOutlet var secondView: UIView!
    
    @IBOutlet var thirdView: UIView!
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        
        primerView.layer.cornerRadius = 16;
        primerView.layer.masksToBounds = false;
        primerView.layer.shadowColor = UIColor.black.cgColor
        primerView.layer.shadowOffset = CGSize(width: 8, height: 8)
        primerView.layer.shadowOpacity = 0.5
        
        secondView.layer.cornerRadius = 16;
        secondView.layer.masksToBounds = false;
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOffset = CGSize(width: 8, height: 8)
        secondView.layer.shadowOpacity = 0.5
        
        thirdView.layer.cornerRadius = 16;
        thirdView.layer.masksToBounds = false;
        thirdView.layer.shadowColor = UIColor.black.cgColor
        thirdView.layer.shadowOffset = CGSize(width: 8, height: 8)
        thirdView.layer.shadowOpacity = 0.5
        
        movieImage.layer.cornerRadius = 8;
        movieImage.layer.masksToBounds = true;
        movieImage.layer.borderWidth = 5;
        movieImage.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25);
        
        
        movieImage.loadImage(fromURL: movies!.poster)
        nameMovie.text = movies!.title
        yearMovie.text = movies!.year
      
        
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
