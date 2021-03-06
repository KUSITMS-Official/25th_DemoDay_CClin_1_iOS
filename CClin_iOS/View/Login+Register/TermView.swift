//
//  TermView.swift
//  CClin_iOS
//
//  Created by 홍세은 on 2022/05/13.
//

import SwiftUI

struct TermView: View {
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
       
    var body: some View {
        ZStack {
            Color(hex: "F3F3F3")
                        .edgesIgnoringSafeArea(.all)
            ScrollView() {
                VStack {
                    HStack {
                    Text("(필수) 서비스 이용 약관")
                        .font(SpoqaHanSansNeo.regular(size: 10))
                        
                        Spacer()
                    }
                }
                .padding()
            }
        }
    }
}

struct TermView_Previews: PreviewProvider {
    static var previews: some View {
        TermView()
    }
}
