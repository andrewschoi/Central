//
//  SubmitViewController.swift
//  Central
//
//  Created by andrew choi on 1/16/23.
//

import Foundation
import UIKit

class SubmitViewController: ObservableObject {
    @Published var success = false
    
    
    init() {
    }
    
    func resetSuccess() {
        success = false
    }
    
    
    
    func submitData(name: String, date: String, location: String, description: String, image: UIImage) {
        let url = URL(string: "https://ud4k4olkrg.execute-api.us-east-2.amazonaws.com/prod/events")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let imageData = image.jpegData(compressionQuality: 0.01) else {return}
        let base64EncodedString = imageData.base64EncodedString()
        
        let body: [String: Any] = ["name": name, "date": date, "location": location, "description": description, "image": base64EncodedString]
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
            
            DispatchQueue.main.async {
                self.success = true
            }
        }
        task.resume()
    }
}
