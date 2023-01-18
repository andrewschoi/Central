//
//  Submit.swift
//  Central
//
//  Created by andrew choi on 1/16/23.
//
import SwiftUI
import UIKit

struct Submit: View {
    @State var name = ""
    @State var date = ""
    @State var location = ""
    @State var description = ""
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    @ObservedObject var viewController = SubmitViewController()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Event Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Event Date", text: $date)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Event Location", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Event Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Spacer()
                    Button("Choose Image") {
                        self.isShowPhotoLibrary = true
                    }
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
                    }
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        self.viewController.submitData(name: self.name, date: self.date, location: self.location, description: self.description, image: self.image)
                    }
                }
                .padding()
            }
            .navigationBarTitle("New Event")
        }
        .onDisappear {
            viewController.resetSuccess()
        }
        .alert(isPresented: $viewController.success) {
            Alert(title: Text("Success"), message: Text("Event has been submitted"), dismissButton: .default(Text("OK")))
        }
    }
}


struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
