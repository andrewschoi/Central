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
        VStack(alignment: .leading) {
            HStack {
                Text(event.name).font(.title2)
                Spacer()
                Text(event.date).font(.title2)
            }
            Text(event.location).font(.title3)
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event(name: "andrew", date: "12/15/2002", location: "ithaca", description: "fun party", image: ""))
    }
}
