//
//  TokenPage.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/18.
//

import SwiftUI

struct TokenPage: View {
    @ObservedObject var logic = TokenLogic()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(logic.items) { token in
                    VStack {
                        HStack(spacing: 12.fitW()) {
                            Image(token.image)
                                .resizable()
                                .frame(width: 60.fitW(), height: 60.fitH())
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("\(token.amount) \(token.name)")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Text("¥\(String(format: "%.2f", token.price))")
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Image("arrow_r").resizable().frame(width: 26.fitW(), height: 26.fitW())
                        }
                        .padding(.horizontal)
                        
                        Divider()
                    }
                }
                .padding(.top)
                
                VStack(spacing: 8.fitH()) {
                    Text("没有代币？")
                        .foregroundColor(.gray)
                        .font(.title3)
                    
                    Button {
                        print("clicked add token...")
                    } label: {
                        Text("添加代币")
                    }
                }
                .padding(.top)
            }
            .padding(.top, 30.fitH())
        }
    }
}

struct TokenPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TokenPage()
        }
    }
}
