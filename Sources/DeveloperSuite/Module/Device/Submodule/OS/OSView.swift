//
//  SwiftUIView.swift
//  
//
//  Created by Bahadır A. Güder on 27.01.2023.
//

import SwiftUI

extension DeviceView.DeviceViewModel.Submodule {
    struct OSView: View {
        var body: some View {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceView.DeviceViewModel.Submodule.OSView()
    }
}
