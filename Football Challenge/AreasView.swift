//
//  AreasView.swift
//  Football Challenge
//
//  Created by Adrian Talbot on 17/08/2024.
//

import SwiftUI

struct AreasView: View {
    @State var areas = [Area]()
    @State var parentId: Int?
    @State private var selected: Area?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List (areas, id: \.self, selection: $selected) { area in
                    
                    // Display only those areas that are children of Africa Area(2001)
                    if (parentId == nil || area.parentAreaId == parentId!) {
                        HStack {
                            Text(String(area.id ?? 0))
                            Text(area.name ?? "Empty")
                            Text(area.parentArea ?? "None")
                            Text(String(area.parentAreaId ?? 0))
                        }
                    }
                }
                .listStyle(.plain)
                
                Text(selected?.name ?? "")
                    .padding(.horizontal)
            }
            .onAppear {
                Task {
                    let ds = FootballDataSource()
                    
                    areas = await ds.getAreas()
                }
            }
            .navigationTitle("Areas")
        }
    }
}

#Preview {
    //    AreasView()
    AreasView(parentId: 2001)
}
