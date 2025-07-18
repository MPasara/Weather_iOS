//
//  WeatherButtonLabelView.swift
//  Weather
//
//  Created by Mladen Pašara on 09.06.2025..
//
import SwiftUI
import Foundation

struct WeatherButtonLabelView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(10)
    }
}
