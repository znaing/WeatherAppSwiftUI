//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Zaid Naing on 4/16/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    
    var body: some View {
        ZStack { 
            BackgroundView(isNight : $isNight)
            VStack{
                CityView(cityName: "Los Angeles, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 73)
                HStack(spacing: 10){
                    
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 73)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.rain.fill", temperature: 61)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 71)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "wind", temperature: 58)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 65)
                    
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label:{
                    weatherButton(title: "Change Day Time", textColor: isNight ? .black : .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .font(.system(size: 28, weight:.medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray :  Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityView: View{
    var cityName : String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}
struct MainWeatherStatusView: View{
    var imageName: String
    var temperature: Int
    var body: some View{
        VStack(spacing:8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}


