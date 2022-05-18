//
//  HomePage.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/16.
//

import Foundation
import SwiftUI

struct HomePage: View {
    
    enum Tabs: Int {
        case tokens, nfts
    }
    
    @State var selectedTab = Tabs.tokens
    @Namespace var animation
    
    @ObservedObject var G = Global.shared
    
    // 设置为 ObservedObject 是为了可以动态改变按钮数量
    @ObservedObject var menuHelper = MenuHelper()
    
    init() {
        menuHelper.items = [
            .receive,
            .buy,
            .send,
            .swap
        ]
    }
    
    var body: some View {
        VStack(spacing: 10.fitH()) {
            NaviBar(title:"钱包", subTitle: "Etherenum Main Network") {
                print("left button clicked...")
            } rightButtonAction: {
                print("right button clicked...")
            }
            /**
             Group 不是必要的，只是方便区分哪些UI元素是同一个组的，方便理解
             */
            Group {
                Image("avatar").resizable().frame(width: 46.fitW(), height: 46.fitW()).clipShape(Circle()).padding(6.fitW()).background(Circle().stroke(Color.blue, lineWidth: 3.fitW()))
                Text("\(G.currentAccountName)").foregroundColor(Global.Colors.title).font(.system(size: 36.fitW(), weight: .regular, design: .default))
                Text("\(String(format: "%@ %.2f", G.currentCurrencySymbol, G.currentBalance))")
                Text("\(G.currentWalletAddress)").truncationMode(.middle).frame(width: 200.fitW()).lineLimit(1)
                    .padding(.horizontal, 12.fitH())
                    .padding(.vertical, 10.fitH())
                    .background(Capsule().fill(Color(hexR: 236, g: 244, b: 254)))
            }
            
            Group {
                HStack(spacing: 26.fitW()) {
                    ForEach(menuHelper.items) {
                        item in
                        Button {
                            print("clicked at \(item.id)")
                        } label: {
                            VStack(spacing: 4.fitH()) {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 46.fitW(), height: 46.fitW())
                                    .overlay(Image(item.image).resizable().foregroundColor(.white))
                                Text("\(item.title)")
                            }
                        }.frame(width: 50.fitW())
                    }
                }
            }
            
            Group {
                TabView(selection: $selectedTab) {
                    TokenPage().tag(Tabs.tokens)
                    NFTSPage().tag(Tabs.nfts)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .overlay(
                    VStack(spacing: 2.fitH()) {
                        HStack {
                            VStack {
                                Text("代币")
                                    .foregroundColor(selectedTab == Tabs.tokens ? .blue : .gray)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                
                                if selectedTab == Tabs.tokens {
                                    Rectangle()
                                        .fill(.blue)
                                        .frame(height: 3.fitH())
                                        .matchedGeometryEffect(id: "tab", in: animation)
                                } else {
                                    Rectangle()
                                        .fill(.white)
                                        .frame(height: 3.fitH())
                                }
                                
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedTab = Tabs.tokens
                                }
                            }.background(Rectangle().fill(.white))
                            
                            
                            VStack {
                                Text("收藏品")
                                    .foregroundColor(selectedTab == Tabs.nfts ? .blue : .gray)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                
                                if selectedTab == Tabs.nfts {
                                    Rectangle()
                                        .fill(.blue)
                                        .frame(height: 3.fitH())
                                        .matchedGeometryEffect(id: "tab", in: animation)
                                } else {
                                    Rectangle()
                                        .fill(.white)
                                        .frame(height: 3.fitH())
                                }
                                
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedTab = Tabs.nfts
                                }
                            }
                            .background(Rectangle().fill(.white))
                        }
                        
                        Divider()
                    }
                        .foregroundColor(.white), alignment: .top
                ).padding(.top)
            }
        }
    }
}


//struct HomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePage()
//    }
//}
