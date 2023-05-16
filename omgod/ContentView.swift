//
//  ContentView.swift
//  omgod
//
//  Created by 문관영 on 2023/03/15.
//

import SwiftUI

struct InstagramCloneView: View {
    var body: some View {
        StartTabView()
    }
}


//view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramCloneView()
    }
}



struct StartTabView: View{
    @State var SelectionTab = 0
    @State var isActive = false
    @State private var tappedTwice = false

    
    
    var handler: Binding<Int> { Binding(
            get: { self.SelectionTab },
            set: {
                if $0 == self.SelectionTab {
                    tappedTwice = true
                }
                self.SelectionTab = $0
            }
        )}
    
    
    var body: some View {
        TabView(selection: handler ){
            NavigationView{
                //0
                VStack{
                    //타이틀뷰
                    MainTitleView()
                   
                    ScrollView(.vertical ){
                        
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ParkPlus()
                                StoryView()
                            }
                        }
                        Divider()
                        
                        // 스토리 사람뷰
                        StoryPorsonView(isActive: $isActive)
                            .onChange(of: tappedTwice, perform: {tap in
                                if tap == true {
                                    self.isActive = false
                                    self.tappedTwice = false
                                }
                            })
                        
                        // 메인뷰
                        MainView()
                        //미들타이틀뷰
                        MiddleTitleView()
                        Divider()
                    }
                }
            }
            .tabItem{
                Image(systemName: "house").onTapGesture {
                    print("123")
                }
            }
            .tag(0)
            //1
           SearChBar()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            Text("2")
                .tabItem{
                    Image(systemName: "plus.square")
                }.tag(2)
            //3
            
            Text("3")
                .tabItem{
                    Image(systemName: "play.square")
                }.tag(3)
            //4
            
            NavigationView{
                ProfileView()
                    
            }.tabItem{
                Image(systemName: "person.circle")
            }.tag(4)
        }
    }
}

struct ProfileView : View {
    var body: some View {
        VStack{
            //프로필타이틀뷰
            ProfileTitleView()
            ScrollView(.vertical , showsIndicators: false){
                Text("View Professional Resources").foregroundColor(.blue)
                Divider()
                //프로필탑뷰
                ProfileTopView()
                PersonProfile()
                PersonProfileBoxButton()
                ScrollView(.horizontal , showsIndicators: false){
                    PersonProfileStory()
                }
                PersonProfilePhoto()
            }
            Spacer()
        }
    }
}

struct SearChBar : View {
    @State private var searchText = ""
    let images = ["moon","moon1","moon2", "park", "boong", "bbeam", "flo1", "flo2", "flo3", "flo4", "flo5", "flo6"]
    
    var filteredImages : [String]{
        // isEmpty : 배열이 비어있는지 확인
        if searchText.isEmpty{
            return images
        } else {
            return images.filter {
                // $0 : 0번째 인덱스 부터
                //lowercased : 모두 소문자로 변환
                //contains : 문자열에 요소가 포함되어있는지 확인
                $0.lowercased().contains(searchText.lowercased())
                
            }
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                TextField("검색", text:$searchText)
                // 첫문자 대문자로 안바뀌는 코드
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    )
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing,10)
                    })
                }
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(filteredImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(CGFloat(16/16) ,contentMode: .fit)
                            .frame(height: 100)
                    }
                }
            }
        }
    }
}
