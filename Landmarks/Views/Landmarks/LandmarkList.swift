//
//  LandmarkList.swift
//  Landmarks
//
//  Created by S-wayMock2 on 2021/02/12.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly) || landmark.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly, label: {
                    Text("Favorite Only")
                })
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
