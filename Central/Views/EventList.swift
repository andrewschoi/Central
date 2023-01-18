//
//  EventList.swift
//  Central
//
//  Created by andrew choi on 1/16/23.
//

import SwiftUI

struct EventList: View {
    @ObservedObject var viewModel = EventViewController()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.events.isEmpty {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                        Text("No events found.")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 100)
                } else {
                    List {
                        ForEach(viewModel.events, id: \.name) { event in
                            NavigationLink(destination: EventDetail(event: event)) {
                                EventRow(event: event)
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets())
                }
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: Submit()) {
                        Text("Add Event")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
        
}




struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
