//
//  SponsoredDetailView.swift
//  CClin_iOS
//
//  Created by 홍세은 on 2022/05/23.
//

import SwiftUI
import Foundation

struct SponsoredDetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var isMyPageViewActive: Bool = false
    @State var inputComment: String = ""
        
    @State var commentArray: [Comment] = [Comment(image: "logo_readyme", name: "레디미", date: "05/18  07:12", description:  "자세한 프로젝트 진행 일정 및 평가 심사항목이 무엇인가요?")]
    
    @ObservedObject var user = UserModel.shared
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            Image("logo_kusitms")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 46)
                                .cornerRadius(5)
                                .padding(.trailing, 11)
                            
                            VStack(alignment: .leading) {
                                Text("한국대학생IT경영학회")
                                    .font(SpoqaHanSansNeo.bold(size: 13))
                                    .padding(.bottom, 3)
                                
                                Text("05/15  23:57")
                                    .foregroundColor(Color(hex: "D8D8D8"))
                                    .font(SpoqaHanSansNeo.regular(size: 11))
                                
                            }
                            Spacer()
                        }
                        .padding(.bottom, 15)
                        
                        VStack() {
                            HStack {
                                Text("기업 프로젝트 평가단 모집")
                                    .font(SpoqaHanSansNeo.bold(size: 17))
                                    .padding(.bottom, 17)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("5개의 기업과 10일간 진행되는 기업 프로젝트 발표식에 평가단을 모집합니다.")
                                    .font(SpoqaHanSansNeo.medium(size: 13))
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, 27)
                        
                        HStack {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color.main_club)
                            Text("11")
                                .foregroundColor(Color(hex: "ACACAC"))
                        }
                        .font(SpoqaHanSansNeo.medium(size: 13))
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 31)
                    
                    Rectangle()
                        .foregroundColor(Color.gray_button_line)
                        .frame(height: 8)
                    
                    VStack {
                        ForEach(commentArray, id:\.self) { i in
                            CommentView(image: i.image, name: i.name, date: i.date, description: i.description)
                        }
                        .padding(.vertical, 21)
                    }
                    .padding(.horizontal, 31)
                }
            }
            TextField("", text:$inputComment)
                .keyboardType(.default)
                .textFieldStyle(RoundTextFieldStyle(backgroundColor: Color.gray_bottom))
                .overlay(
                    HStack {
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 1, height: 22)
                            .foregroundColor(Color.gray_bottom_text)
                            .padding(.trailing, 15)
                        
                        Button {
                            let date = Date()
                            let calendar = Calendar.current
                            let hour = calendar.component(.hour, from: date)
                            let minutes = calendar.component(.minute, from: date)
                            
                            let commentNow = Comment(image: "logo_1q", name: "원큐", date: "05/28 \(hour):\(minutes)", description: inputComment)
                            
                            commentArray.append(commentNow)
                            
                           inputComment = ""
                            
                        } label: {
                            Text("게시")
                                .foregroundColor(Color.gray_bottom_text)
                                .font(SpoqaHanSansNeo.medium(size: 11))
                        }
                        .padding(.trailing, 17)
                    })
                .padding(.horizontal, 31)
                .padding(.bottom, 30)
        }
        .navigationTitle("제휴/협찬")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color.black)
                        .font(SpoqaHanSansNeo.regular(size: 20))
                }
            }
            
            ToolbarItem(placement: .principal) {
               Text("제휴/협찬")
                    .font(SpoqaHanSansNeo.bold(size: 20))
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isMyPageViewActive = true
                } label: {
                    Image("ic_mypage")
                        .padding(.trailing, 15)
                }
                .background(
                    NavigationLink(isActive: $isMyPageViewActive, destination: {
                        if user.type == .club {
                            ClubMyPageView()
                        } else {
                            CompanyMyPageView()
                        }
                    }, label: {
                        EmptyView()
                    })
                    
                )
            }
        }
    }
}

struct SponsoredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SponsoredDetailView()
    }
}
