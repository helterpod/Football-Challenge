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
    
    var body: some View {
        VStack(alignment: .leading) {
            List (areas) { area in
                
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
        }
        .onAppear {
            Task {
                let ds = FootballDataSource()
                
                areas = await ds.getAreas()
            }
        }
    }
}

#Preview {
//    AreasView()
    AreasView(parentId: 2001)
}
