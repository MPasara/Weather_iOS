//
//  ContentView.swift
//  Weather
//
//  Created by Mladen Pašara on 08.06.2025..
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 18 : 28)
               
                HStack(spacing:10){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                   temperature: 22)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "moon.fill" : "sun.max.fill",
                                   temperature: 26)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind",
                                   temperature: 14)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "cloud.moon.bolt.fill" : "cloud.sun.bolt.fill",
                                   temperature: 16)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.moon.fill",
                                   temperature: 2)
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButtonLabelView(title: "Change Day Time", textColor:isNight ? .black : .white, backgroundColor: isNight ? .gray : .mint)
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .edgesIgnoringSafeArea(.all)
        ContainerRelativeShape().fill(isNight ? Color.black.gradient : Color.blue.gradient).ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}


