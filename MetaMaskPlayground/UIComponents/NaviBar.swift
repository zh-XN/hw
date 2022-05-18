//
//  NaviBar.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/18.
//

import SwiftUI

struct NaviBar: View {
    
    @State var hidesButtons = false
    @State var hidesSubTitle = false
    
    @State var title = ""
    @State var subTitle = ""
    
    var leftButtonAction: (()->Void)?
    var rightButtonAction: (()->Void)?
    
    var body: some View {
        VStack {
            HStack {
                if !hidesButtons {
                    Button {
                        if leftButtonAction != nil {
                            leftButtonAction!()
                        }
                    } label: {
                        Image("more")
                            .resizable().frame(width: 20.fitW(), height: 20.fitW())
                    }
                }
                
                Spacer()
                
                VStack(spacing: 4.fitH()) {
                    Text("\(self.title)")
                        .font(.title)
                        .fontWeight(.light)
                    if !hidesSubTitle {
                        HStack {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 8.fitW(), height: 8.fitW())
                            
                            Text("\(self.subTitle)")
                                .font(.callout)
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Spacer()
                
                if !hidesButtons {
                    Button {
                        if rightButtonAction != nil {
                            rightButtonAction!()
                        }
                    } label: {
                        Image("scan")
                            .resizable().frame(width: 20.fitW(), height: 20.fitW())
                    }
                }
            }
            .padding(.horizontal)
            Divider()
        }
    }
    
}


struct NaviBar_Previews: PreviewProvider {
    static var previews: some View {
        NaviBar()
    }
}
