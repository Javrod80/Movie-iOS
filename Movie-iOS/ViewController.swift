//
//  ViewController.swift
//  Movie-iOS
//
//  Created by Mañanas on 8/5/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var movies : [Movies] = []
    
    
    @IBOutlet var tableMovie: UITableView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableMovie.delegate = self
        self.tableMovie.dataSource = self
        tableMovie.rowHeight = 130
        
        Task.init {
            await fetchMovies()
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableMovie.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MovieCell = tableMovie.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieCell
        
        
        let movie = movies[indexPath.item]
        
        
        
        cell.nameMovie.text = movie.title
        cell.imageMovie.loadImage(fromURL: movie.poster)
        cell.yearMovie.text = movie.year
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(movies[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    func fetchMovies() async {
        
        
        do {
            movies = try await MovieProvider.getMovieFromApi(query: "mario")
            print(movies.count)
            
            
            DispatchQueue.main.async {
                self.tableMovie.reloadData()
            }
        } catch {
            print("Error al obtener movies: \(error)")
        }
        print ("fin")
    
        
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
       
        
        guard let indexPath =  tableMovie.indexPathForSelectedRow else {
            print("No movie selected")
            return
        }
        
        let movies = movies[indexPath.row]
        let viewController: DetailViewController = segue.destination as! DetailViewController
        
        viewController.movies = movies
        
       
       
        
        
        
    }
    


    

    
    
    
}
