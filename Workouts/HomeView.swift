//
//  HomeView.swift
//  Workouts
//
//  Created by than.duc.huy on 05/05/2021.
//

import SwiftUI

struct HomeView: View {
    @State var stepAnimation = false
    @State var step = 0
    @State var selectItem = 0
    
    let items = [
        Sport(id: 1, image: "badminton", progress: 32),
        Sport(id: 2, image: "baseball1", progress: 48),
        Sport(id: 3, image: "basketball", progress: 29),
        Sport(id: 4, image: "bowling", progress: 91),
        Sport(id: 5, image: "boxing", progress: 65),
        Sport(id: 6, image: "soccer", progress: 21),
        Sport(id: 7, image: "tennis", progress: 56)
    ]
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { reader in
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(Color("red"))
                            .frame(width: reader.size.width * 0.35)
                        Rectangle()
                            .foregroundColor(Color("black"))
                    }
                    .cornerRadius(30)
                }
                
                VStack {
                    HStack {
                        Text("Workouts")
                            .font(.system(size: 42, weight: .black))
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "circlebadge.fill")
                                .foregroundColor(Color("red"))
                                .font(.system(size: 10))
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 25))
                            })
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                }
            }.frame(width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height * 0.35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 42) {
                HStack(spacing: 10) {
                    HStack(spacing: 0) {
                        Image("foot")
                            .renderingMode(.template)
                            .foregroundColor(Color("red"))
                            .offset(y: stepAnimation ? 5 : -5)
                        
                        Image("foot")
                            .renderingMode(.template)
                            .foregroundColor(Color("red"))
                            .offset(y: stepAnimation ? -5 : 5)
                    }
                    
                    Text("Steps")
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                }
                
                HStack {
                    Text("\(step)")
                        .font(.system(size: 32, weight: .black))
                    
                    Spacer()
                    
                    HStack {
                        Text("Send")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("red"))
                            .padding(.horizontal, 16)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "bell.fill")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("red"))
                                .cornerRadius(20)
                        })
                    }
                    .background(Color("red").opacity(0.1))
                    .cornerRadius(20)
                }
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal, 38)
            .offset(y: -80)
            .shadow(radius: 5)
            
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(items, id: \.self) { item in
                            VStack {
                                Spacer()
                                
                                VStack {
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(20)
                                        .background(Color(selectItem == item.id ? "red" : "gray"))
                                        .cornerRadius(15)
                                    
                                    Text("\(item.progress) %")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.vertical, 30)
                                        .foregroundColor(Color(selectItem == item.id ? "red" : "black"))
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                
                                Spacer()
                            }
                            .offset(y: item.offset)
                            .onTapGesture {
                                selectItem = item.id
                            }
                            .shadow(radius: 5)
                        }
                    }
            }
            
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 25))
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "house.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Color("black"))
                        .cornerRadius(25)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "list.bullet.indent")
                        .font(.system(size: 25))
                })
            }
            .foregroundColor(Color("gray"))
            .padding(.bottom, 20)
            .padding()
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                step += 1
                
                withAnimation(.spring()) {
                    stepAnimation.toggle()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
