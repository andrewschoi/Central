//
//  EventViewController.swift
//  Central
//
//  Created by andrew choi on 1/16/23.
//

import Foundation
import SwiftUI

class EventViewController: ObservableObject {
    @Published var events: [Event] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://ud4k4olkrg.execute-api.us-east-2.amazonaws.com/prod/events")!
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let error = error {
                print("error", error)
                return
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode([Event].self, from: data)
                DispatchQueue.main.async {
                    self.events = result
                }
            } catch {
                print("decode", error)
            }
        }
        task.resume()
    }
    
    func incrementVote(name: String) {
        let url = URL(string: "https://ud4k4olkrg.execute-api.us-east-2.amazonaws.com/prod/upvote")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["name": name]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let _ = data, let _ = response as? HTTPURLResponse else {
                return
            }
        }
        task.resume()
    }
    
}
