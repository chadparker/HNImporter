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
        VStack {
            Text("HN Importer")
            ProgressView("", value: Float(importer.fileCountProgress), total: Float(importer.fileCountTotal))
                        .frame(width: 300)
            Text("Current: \(importer.fileCountProgress)")
            Text("Total: \(importer.fileCountTotal)")
            Text("Posts Imported: \(importer.postsImportedCount)")
        }
        .frame(width: 400, height: 250)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(PostImporter())
    }
}
