//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Slawek on 12/05/2022.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    @EnvironmentObject var prospects: Prospects
    let filter: FilterType
    
    var body: some View {
        NavigationView {
            Text("People: \(prospects.people.count)")
                .navigationTitle(title)
                .toolbar {
                       Button {
                           let prospect = Prospect()
                           prospect.name = "Paul Hudson"
                           prospect.emailAddress = "paul@hackingwithswift.com"
                           prospects.people.append(prospect)
                       } label: {
                           Label("Scan", systemImage: "qrcode.viewfinder")
                       }
                   }
        }
    }
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
