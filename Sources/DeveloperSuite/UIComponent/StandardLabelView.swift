//
//  StandardLabelView.swift
//
//
//  Created by Bahadır A. Güder on 29.01.2023.
//

import SwiftUI

struct StandardLabelView: View {
    let key: String
    let value: String

    var body: some View {
        Label(key, systemImage: "")
            .badge(value)
            .labelStyle(.titleOnly)
    }
}

struct LabelView_Previews: PreviewProvider {
    static let key = "Key"
    static let value = "Value"

    static var previews: some View {
        StandardLabelView(key: key, value: value)
    }
}
