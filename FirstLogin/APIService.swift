//
//  APIService.swift
//  FirstLogin
//
//  Created by ashish on 06/10/25.
//

import Foundation

class APIService {
    func fetchUsers(completion: @escaping ([User]?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Invalid URL")
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(users)
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
