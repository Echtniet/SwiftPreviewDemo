//
//  ContentView.swift
//  SwiftPreviewDemo
//
//  Created by Davelaar,Clinton B on 2/1/21.
//  Copyright © 2021 Davelaar,Clinton B. All rights reserved.
//

import SwiftUI

struct User: Identifiable, Hashable{
    var id: Int
    
    let username, message, imageName: String
}

struct ContentView: View {
    
    let users:[User] = [
        .init(id: 0, username: "Tim Cook", message: "We in this", imageName: "tim"),
        .init(id: 1, username: "Craig Federighi", message: "We in this", imageName: "craig"),
        .init(id: 2, username: "Jon Ivey", message: "this is a very very very long text just for the sake of being long and testing this thing out yeah!", imageName: "ive")
    ]
    
    var body: some View {
        NavigationView{
            /*List (users){
                Text($0.username)
            }.navigationBarTitle(Text("Dynamic List"))
            */
            List {
                Text("Users").font(.largeTitle)
                ForEach(users, id: \.self) { user in
                    //user row
                    UserRow(user: user)
                }
                //Text($0.username)
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow: View{
    
    let user: User
    var body: some View{
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
                //.clipped()
            VStack (alignment: .leading){
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline)
                .lineLimit(nil)
            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
