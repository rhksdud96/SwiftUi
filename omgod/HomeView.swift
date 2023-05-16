//
//  HomeView.swift
//  omgod
//
//  Created by 문관영 on 2023/04/20.
//

import SwiftUI

struct MainTitleView : View{
    var body : some View{
        HStack{
            Image("instar").resizable().frame(width: 100, height: 100).offset(y:5)
            Spacer()
            Image(systemName: "magnifyingglass").resizable().frame(width: 45, height: 45)
            
            ZStack{
                Image(systemName: "message").resizable().frame(width: 42, height: 42)
                Circle().fill(Color.white).frame(width: 24, height: 24).offset(x:10, y:-14)
                Image(systemName: "3.circle.fill")
                    .resizable().foregroundColor(Color.red).frame(width: 30, height: 30).offset(x: 10, y:-17)
            }.padding(5)
        }.padding(4.0).frame(height: 60.0)
    }
}

struct ParkPlus: View {
    var body: some View{
        VStack{
            ZStack{
                Image("park").resizable().frame(width: 60, height: 60).clipShape(Circle())
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
                    .offset(x:15,y:20)
                Image(systemName:"plus.circle.fill" ).resizable().foregroundColor(Color.blue).frame(width: 25, height: 25).offset(x: 15, y: 20)
            }.padding(.bottom, 5)
                .padding(.leading, 10)
            Text("박종하")
        }
    }
}

struct StoryView: View {
    
    var body: some View {
        HStack{
            VStack{
                ZStack{
                    Circle()
                        .strokeBorder(
                            LinearGradient(gradient: Gradient(colors: [.red,.blue,.yellow,.green])
                                           , startPoint: .topLeading, endPoint: .bottomLeading),lineWidth: 3
                        )
                        .frame(width: 90, height: 90)
                    Image("moon1").resizable().frame(width: 80, height: 80).clipShape(Circle())
                }
                Text("moon0")
            }
            VStack{
                ZStack{
                    Circle()
                        .strokeBorder(
                            LinearGradient(gradient: Gradient(colors: [.red, .blue, .yellow, .green]), startPoint: .topLeading, endPoint: .bottomLeading),lineWidth: 3
                        ).frame(width: 90, height: 90)
                    Image("boong").resizable().frame(width: 80, height: 80).clipShape(Circle())
                }
                Text("Boong")
            }
            VStack{
                ZStack {
                    Circle()
                        .strokeBorder(
                            LinearGradient(gradient: Gradient(colors: [.red, .blue, .yellow, .green]), startPoint: .topLeading, endPoint: .bottomLeading)
                            ,lineWidth: 3
                        ).frame(width: 90, height: 90)
                    Image("moon2").resizable().frame(width: 80, height: 80).clipShape(Circle())
                }
                Text("Moon1")
                
            }
            
            VStack{
                ZStack{
                    Circle(
                    ).strokeBorder(LinearGradient(gradient: Gradient(colors: [.red, .blue, .yellow, .green]), startPoint: .topLeading, endPoint: .bottomLeading),lineWidth: 3
                    ).frame(width: 90, height: 90)
                    Image("moon").resizable().frame(width: 80, height: 80).clipShape(Circle())
                }
                Text("Moon2")
            }
        }.padding(.horizontal, 10)
        
        
    }
    
}

struct StoryPorsonView: View {
    @Binding var isActive : Bool
    var body: some View {
        HStack{
            NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true), isActive: $isActive){
                    Image("park").resizable().frame(width: 60,height: 60).clipShape(Circle())
                    Text("Park").foregroundColor(.black)
            }
            Spacer()
            Image(systemName: "ellipsis")
        }.padding(.horizontal, 10)
    }
}

struct MainView: View {
    var mainimage = "fol"
    var body: some View {
        HStack{
            Image(mainimage).resizable().frame(height: 400)
        }
    }
}

struct MiddleTitleView: View {
    @StateObject var viewModel:UserViewModel = UserViewModel()
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    if self.viewModel.user.click == true {
                        self.viewModel.user.count += 1
                        self.viewModel.user.click = false
                    }else {
                        self.viewModel.user.count -= 1
                        self.viewModel.user.click = true
                    }})
                {
                    Image(systemName: self.viewModel.user.click ? "heart" : "heart.fill")
                        .resizable().frame(width: 40,height: 40).foregroundColor(.red)
                    
                }
                Image(systemName: "message")
                    .resizable().frame(width: 40,height: 40)
                Image(systemName: "paperplane")
                    .resizable().frame(width: 40,height: 40)
                Spacer()
                Image(systemName: "bookmark.fill")
                    .resizable().frame(width: 40,height: 40)
            }.padding(.horizontal, 10)
            
            HStack{
                Text("2,000,432,111 views")
                Text("\(self.viewModel.user.count)명이 이 게시글을 좋아합니다.")
                Spacer()
            }.padding(.horizontal, 10)
            
            Spacer()
            
            HStack{
                Text("오늘은 벚꽃구경을 갔다. 아주 이쁜 핑크 벚꽃이였다. ")
                Spacer()
            }.padding(.horizontal, 10)
            
            Spacer()
            
        }
    }
}
