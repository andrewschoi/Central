//
//  EventDetail.swift
//  Central
//
//  Created by andrew choi on 1/16/23.
//

import SwiftUI

struct EventDetail: View {
    var event: Event
    
    var body: some View {
        VStack {
            Text(event.description)
            
            AsyncImage(url: URL(string: event.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
        }
        
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: Event(name: "andrew", date: "12/15/2002", location: "ithaca", description: "fun party", image: "https://central-event-images.s3.us-east-2.amazonaws.com/Bsadsada"))
    }
}
