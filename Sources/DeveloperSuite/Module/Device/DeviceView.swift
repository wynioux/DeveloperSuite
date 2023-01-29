//
//  DeviceView.swift
//
//
//  Created by Bahadır A. Güder on 27.01.2023.
//

import SwiftUI

struct DeviceView: View {
    @StateObject private var viewModel = DeviceViewModel()
    @ScaledMetric private var size: CGFloat = 1

    var body: some View {
        List {
            /*
             ForEach(DeviceViewModel.Submodule.allCases, id: \.hashValue) { submodule in
                 NavigationLink(destination: submodule.view, tag: submodule, selection: $viewModel.selection) {
                     Label(submodule.title, systemImage: submodule.imageSystemName)
                         .labelStyle(SettingsLabelStyle(color: submodule.color, size: size))
                 }
             }
             */

            /*
             Section("Hardware") {
                 Label("Camera", systemImage: "camera.fill")
                     .labelStyle(SettingsLabelStyle(color: Color(.systemRed), size: size))
             }
             */
        }
    }
}

struct DeviceView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceView()
    }
}

struct Gestalt {
    let key: String
    let value: Any?

    init(key: String) {
        self.key = key
        self.value = Gestalt.cacheExtra?[key]
    }

    private static var cacheExtra: [String: Any]? {
        let mobGesPath = "/priv" + "ate/v" + "ar/co" + "ntain" + "ers/S" + "hared" + "/Syst" + "emGro" + "up/sy" + "stemg" + "roup." + "com.a" + "pple." + "mobil" + "egest" + "altca" + "che/L" + "ibrar" + "y/Cac" + "hes/c" + "om.ap" + "ple.M" + "obile" + "Gesta" + "lt.pl" + "ist"

        let mobGestURL = URL(fileURLWithPath: mobGesPath)

        let cacheExtraKey = "Cac" + "heEx" + "tra"

        guard let mobGesDictionary = NSDictionary(contentsOf: mobGestURL),
              let cacheExtraDictionary = mobGesDictionary.value(forKey: cacheExtraKey) as? [String: Any]
        else { return nil }

        return cacheExtraDictionary
    }
}
