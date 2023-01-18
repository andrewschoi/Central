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
    
}
