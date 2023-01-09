//
//  ContentView.swift
//  uitest
//
//  Created by Unnati on 20/10/1944 Saka.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
           
                Text("Hello Zomato").padding().background(Color.red.blur(radius: 3.0))
                
                
                Image("D2D").resizable()
            }
        

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
