//
//  EventRow.swift
//  Central
//
//  Created by andrew choi on 1/16/23.
//

import SwiftUI

struct EventRow: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
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
            
            Text(event.description)
                .font(.body)
                .foregroundColor(.primary)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)

        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}


struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event(name: "andrew", date: "12/15/2002", location: "ithaca", description: "fun party", image: "https://central-event-images.s3.us-east-2.amazonaws.com/Bsadsada", upvotes: "0"))
    }
}
