//
//  SelectView.swift
//  Football Challenge
//
//  Created by Adrian Talbot on 18/08/2024.
//

import SwiftUI

struct SelectView: View {
    @State private var selection: String?
    
    let names = [
        "Alpha",
        "Beta",
        "Gamma",
        "Delta",
        "Omega"
    ]
    var body: some View {
        NavigationView {
            List(names, id: \.self, selection: $selection) { name in
                Text(name)
            }
            .navigationTitle("List selection")
//            .toolbar {
//                EditButton()
//            }
        }
        Text("\(selection ?? "Nothing")")
    }
}

#Preview {
    SelectView()
}
