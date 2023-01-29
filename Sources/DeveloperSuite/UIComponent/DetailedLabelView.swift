//
//  DetailedLabelView.swift
//
//
//  Created by Bahadır A. Güder on 29.01.2023.
//

import SwiftUI

struct DetailedLabelView: View {
    let key: String
    let value: String

    var body: some View {
        NavigationLink(key) {
            List {
                Label(value, systemImage: "")
                    .labelStyle(MonospacedLabelStyle())
            }
            .navigationTitle(key)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailedLabelView_Previews: PreviewProvider {
    static let key = "SomeID"
    static let value = UUID().uuidString

    static var previews: some View {
        DetailedLabelView(key: key, value: value)
    }
}
