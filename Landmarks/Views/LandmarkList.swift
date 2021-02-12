//
//  LandmarkList.swift
//  Landmarks
//
//  Created by S-wayMock2 on 2021/02/12.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { devicename in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: devicename))
                .previewDisplayName(devicename)
        }
        
    }
}
