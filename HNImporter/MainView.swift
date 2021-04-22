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
            Text("NewsGoose Importer")
                .font(.title)
                .padding()
            VStack {
                ProgressView("Importing posts…", value: Float(importer.fileCountProgress), total: Float(importer.fileCountTotal))
                HStack {
                    Text("\(importer.postsImportedCount) posts imported")
                    Spacer()
                    Text("file \(importer.fileCountProgress) of \(importer.fileCountTotal)")
                }
                .font(.callout.monospacedDigit())
                .foregroundColor(.gray)
            }
            .frame(width: 300)
        }
        .padding()
        .padding(.bottom) // window size bug
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(PostImporter())
    }
}
