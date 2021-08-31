//
//  ContentView.swift
//  LineLoginDemo
//
//  Created by Thongchai Subsaidee on 31/8/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var lineLoginVM = LineLoginViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
                
                // Button
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.green, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                    .overlay(
                        HStack {
                            Image("LINE_Brand_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Line Login Demo")
                        }
                    )
                    .onTapGesture {
                        lineLoginVM.login()
                    }
                
                // Display
                Form {
                    
                    Section(header: Text("User ID:")) {
                        Text(lineLoginVM.userID)
                    }
                    
                    Section(header: Text("User Display Name:")) {
                        Text(lineLoginVM.displayName)
                    }
                    
                    Section(header: Text("Email")) {
                        Text(lineLoginVM.email)
                    }
                    
                    Section(header: Text("Picture")) {
                        Image(uiImage: lineLoginVM.pictureURL ?? UIImage())
                            .resizable()
                            .scaledToFit()
                    }
                    
                }
                
                
            }
            .padding()
            
            .navigationBarTitle(Text("Line"))
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
