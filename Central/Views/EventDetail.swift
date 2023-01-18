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
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(event.name)
                            .font(.title)
                            .foregroundColor(.primary)
                            .bold()
                        Text(event.date)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                HStack {
                    Text(event.location)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Image(systemName: "mappin.and.ellipse")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                
                Divider()
                    .padding(.horizontal, 20)
                
                Text(event.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                
                AsyncImage(url: URL(string: event.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                } placeholder: {
                    ProgressView()
                }
            }
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}



struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: Event(name: "andrew", date: "12/15/2002", location: "ithaca", description: "fun party", image: "https://central-event-images.s3.us-east-2.amazonaws.com/Bsadsada", upvotes: "0"))
    }
}
