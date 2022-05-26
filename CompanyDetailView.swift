//
//  CompanyDetailView.swift
//  CClin_iOS
//
//  Created by 민경 on 2022/05/26.
//

import SwiftUI

struct CompanyDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack() {
            ZStack
            {
                Image("background_goqual")
                
                HStack(spacing: 22) {
                    Image("logo_goqual")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 129)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("IT•웹•통신 | 스타트업")
                            .foregroundColor(Color.white)
                            .font(SpoqaHanSansNeo.medium(size: 11))
                        
                        HStack {
                            Text("고퀄")
                                .foregroundColor(Color.white)
                                .font(SpoqaHanSansNeo.bold(size: 30))
                                .padding(.trailing, 90)
                            
                            Image(systemName: "pencil")
                                .font(SpoqaHanSansNeo.bold(size: 20))
                                .foregroundColor(Color.white)
                        }
                        .padding(.bottom, 20)
                        
                        Text("누구나 쉽게 스마트홈을 누릴 수 있도록 스마트홈 IoT의 대중화를 이끌다")
                            .lineLimit(2)
                            .font(SpoqaHanSansNeo.medium(size: 11))
                            .padding(.bottom, 20)
                    }
                }
                .padding(.top, 130)
                
                Rectangle()
                    .foregroundColor(Color.gray_button_line)
                    .frame(height: 1)
                    .padding(.top, 275)
                    .padding(.horizontal, 33)
            }
            
        }
    }
}
