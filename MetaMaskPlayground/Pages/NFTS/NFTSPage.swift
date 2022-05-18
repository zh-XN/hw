//
//  NFTSPage.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/18.
//

import SwiftUI

struct NFTSPage: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 20)
                .foregroundColor(.clear)
            
            Image("metamask-error")
                .resizable()
                .frame(width: 80.fitW(), height: 80.fitW())
                .padding(10)
                .background(Circle().stroke(Color.gray.opacity(0.6), lineWidth: 5.fitW()))
            
            Text("No NFTs yet")
                .font(.largeTitle.bold())
            
            Button {
               print("clicked learn more...")
            } label: {
                Text("Learn more")
                    .foregroundColor(.blue)
                    .font(.title)
            }
            
            VStack(spacing: 10.fitH()) {
                Text("您没有任何收藏品！")
                Button {
                    
                } label: {
                    Text("添加收藏品")
                        .foregroundColor(.blue)
                }
            }.padding()
        }
        .foregroundColor(Color.gray.opacity(0.98))
        .padding(.top, 30.fitH())
    }
}

struct NFTSPage_Previews: PreviewProvider {
    static var previews: some View {
        NFTSPage()
    }
}
