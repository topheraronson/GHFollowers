//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/14/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let baseUrl = "https://api.github.com/users/"
    
    init() { }
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, "Unable to complete request. Please check you internet conection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse,
            response.statusCode == 200
            else {
                completed(nil, "Invalid response from server. Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data recived from the server was invalid. Please try again.")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                
                completed(nil, "The data recived from the server was invalid. Please try again.")
            }
            
        }.resume()
        
    }
}
