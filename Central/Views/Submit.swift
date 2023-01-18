//
//  Submit.swift
//  Central
//
//  Created by andrew choi on 1/16/23.
//

import SwiftUI


struct Submit: View {
    @State var name = ""
    @State var date = ""
    @State var location = ""
    @State var description = ""
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    @ObservedObject var viewController = SubmitViewController()
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text("Event Name:")
            TextField("event name...", text: $name)
            Text("Event Date:")
            TextField("event date...", text: $date)
            Text("Event Location:")
            TextField("event location...", text: $location)
            Text("Event Description:")
            TextField("event description...", text: $description)
            
            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                Text("show library")
            }
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
            }
            
            Button("submit", action: {
                self.viewController.submitData(name: self.name, date: self.date, location: self.location, description: self.description, image: self.image)
            })
            
        }.onDisappear {
            viewController.resetSuccess()
        }
        
        Text(viewController.success ? "success" : "")
        
        
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
