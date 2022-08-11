//
//  NetworkClient.swift
//  HomeWork21(shio andghuladze)
//
//  Created by shio andghuladze on 11.08.22.
//

import Foundation
import UIKit


protocol Result{}

struct Success<T>: Result {
    let data: T
}

struct Error: Result {
    let errorMessage: String
}

class NetworkClinet{
    static let configuretion = URLSessionConfiguration.default
    static let session = URLSession(configuration: configuretion)
    
    static func getData<T: Codable>(url: String, codableType: T.Type, onResult: @escaping (Result)-> Void) {
        guard let url = URL(string: url) else {
            onResult(Error(errorMessage: "Invalid Url"))
            return
        }
        
        session.dataTask(with: URLRequest(url: url)){ data, response, error in
            
            if let error = error {
                onResult(Error(errorMessage: error.localizedDescription))
            }
            
            if let data = data {
                if let successData = try? JSONDecoder().decode(codableType, from: data){
                    onResult(Success(data: successData))
                    return
                }
                
                onResult(Error(errorMessage: "Could not parse received data"))
            }
            
        }.resume()
        
    }
    
    static func loadImageInImageView(imageView: UIImageView, imageUrl: String){
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }.resume()
    }
    
}
