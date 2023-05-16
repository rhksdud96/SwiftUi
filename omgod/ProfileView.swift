//
//  ProfileView.swift
//  omgod
//
//  Created by 문관영 on 2023/04/20.
//

import SwiftUI

struct ProfileTitleView : View{
    var body: some View {
        HStack{
            Text("박종하").font(.title)
            Spacer()
            Image(systemName: "text.justify").resizable().frame(width: 30, height: 30)
        }.padding(.horizontal, 20)
        Divider()
    }
}

struct ProfileTopView : View{
    var body: some View {
        HStack{
            ZStack{
                Image("park").resizable().frame(width: 100, height: 100).clipShape(Circle())
                Circle()
                    .fill(Color.white)
                    .frame(width: 25,height: 25)
                    .offset(x : 35 , y : 35)
                Image(systemName: "plus.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(.blue).offset(x : 35, y : 35)
            }
            Spacer()
            HStack{
                VStack{
                    Text("71")
                    Text("Posts")
                }.padding(.horizontal)
                VStack {
                    Text("1,078")
                    Text("Followers")
                }.padding(.trailing, 13)
                VStack {
                    Text("84")
                    Text("Following")
                }
            }
        }.padding(.horizontal, 20).navigationBarBackButtonHidden(true)
    }
}

struct PersonProfile : View{
    var body: some View {
        VStack{
            HStack{
                Text("박종하 - iOS Developer").fontWeight(.bold)
                Spacer().frame(height: 40)
            }
            
            Spacer().frame(height: 10)
            
            HStack{
                Image(systemName: "figure.flexibility")
                Text("iOS Developer, UI / UX Designer")
                Spacer()
            }
            HStack{
                Image(systemName: "figure.golf")
                Text("Himachal Pradesh, India")
                Spacer()
            }
            HStack{
                Image(systemName: "figure.fishing")
                Text("DM me for any qeury regarding iOS")
                Spacer()
            }
            HStack{
                Image(systemName: "figure.hand.cycling")
                Text("Check out this link to buy coolors app")
                Image(systemName: "arrow.down.app.fill")
                Spacer()
            }
            HStack{
                Text("www.naver.com")
                Spacer()
            }
        }.padding(.leading, 20)
    }
}
struct PersonProfileBoxButton : View{
    var body: some View{
        HStack{
            Button(action: {}){
                Text("Edit Profile")
            }.frame(width: 185, height: 50)
                .foregroundColor(.black)
                .background(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            Button(action: {}){
                Text("Promotions")
            }.frame(width: 185, height: 50)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        }.padding(.top , 5)
        HStack{
            Button(action: {}){
                Text("Insights")
            }.frame(width: 120, height: 50)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            Button(action: {}){
                Text("Add Shop")
            }.frame(width: 120, height: 50)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            Button(action: {}){
                Text("Call")
            }.frame(width: 120, height: 50)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        }.padding(.bottom, 15)
        
    }
}
struct PersonProfileStory : View{
    var body: some View {
        HStack {
            VStack {
                ZStack{
                    Circle().strokeBorder(.linearGradient(Gradient(colors: [.red, .green, .pink, .gray]), startPoint: .topLeading, endPoint: .bottomLeading), lineWidth: 2).frame(width: 100, height: 100)
                    Image("fol").resizable().frame(width: 90, height: 90).clipShape(Circle())
                }
                Text("꽃1")
            }
            VStack {
                ZStack{
                    Circle().strokeBorder(.linearGradient(Gradient(colors: [.red, .green, .pink, .gray]), startPoint: .topLeading, endPoint: .bottomLeading), lineWidth: 2).frame(width: 100, height: 100)
                    Image("fol").resizable().frame(width: 90, height: 90).clipShape(Circle())
                }
                Text("꽃2")
            }
            VStack {
                ZStack{
                    Circle().strokeBorder(.linearGradient(Gradient(colors: [.red, .green, .pink, .gray]), startPoint: .topLeading, endPoint: .bottomLeading), lineWidth: 2).frame(width: 100, height: 100)
                    Image("fol").resizable().frame(width: 90, height: 90).clipShape(Circle())
                }
                Text("꽃3")
            }
            VStack {
                ZStack{
                    Circle().strokeBorder(.linearGradient(Gradient(colors: [.red, .green, .pink, .gray]), startPoint: .topLeading, endPoint: .bottomLeading), lineWidth: 2).frame(width: 100, height: 100)
                    Image("fol").resizable().frame(width: 90, height: 90).clipShape(Circle())
                }
                Text("꽃4")
            }
        }.padding(.horizontal, 25)
    }
}
struct PersonProfilePhoto : View {
    var ProfilePostData: [ProfilePostModel] = [
        ProfilePostModel(image: "fol", type: "multiple"),
        ProfilePostModel(image: "flo1", type: "video"),
        ProfilePostModel(image: "flo2", type: "multiple"),
        ProfilePostModel(image: "flo3", type: "video"),
        ProfilePostModel(image: "flo4", type: "multiple"),
        ProfilePostModel(image: "flo5", type: "video"),
    ]
    var body: some View{
        VStack{
            HStack{
                // 세로
                LazyHGrid(rows: [GridItem(.fixed(130 )),GridItem(.fixed(130))]){
                    ForEach(ProfilePostData) { datum in
                        Image(datum.image).resizable().frame(width: 130, height: 130)
                    }
                }
            }
        }
        Spacer()
        Divider()
    }
}
