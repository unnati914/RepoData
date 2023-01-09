//
//  ContentView.swift
//  Card App
//
//  Created by Unnati on 20/10/1944 Saka.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("background1").ignoresSafeArea()
            VStack{
                
                Image("Logo")

                HStack{
                    
                    Image("b")
                    Image("b")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
