//
//  ImageViewExtension.swift
//  Movie-iOS
//
//  Created by Mañanas on 8/5/24.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(fromURL urlString: String){
        guard let url = URL(string: urlString) else {
            print("URL inválida: \(urlString)")
            return
        }
        
        // tarea asincrona para cagar imagen
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                    
                }
            }catch {
                print ("Error al cargar la imagen: \(error)")
            }
        }
        
    }
}
