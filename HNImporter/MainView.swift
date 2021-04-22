//
//  MainView.swift
//  HNImporter
//
//  Created by Chad Parker on 4/17/21.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var importer: PostImporter
    
    var body: some View {
        Text("HN Importer")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(PostImporter())
    }
}
