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
            ScrollView {
                NavigationLink {
                    Submit()
                } label: {
                    Text("add a event")
                }
                ForEach (viewModel.events, id: \.name) {
                    event in
                    NavigationLink {
                        EventDetail(event: event)
                    } label: {
                        EventRow(event: event)
                    }
                    Divider()
                }
            }.onAppear {
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
