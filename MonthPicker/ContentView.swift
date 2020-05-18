//
//  ContentView.swift
//  MonthPicker
//
//  Created by Amin on 2/29/1399 AP.
//  Copyright © 1399 AP amin torabi. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           Calendar()
        }
    }
}
struct Calendar : View {
    @State var position:CGPoint  = .zero
    @State var size:CGSize = .zero
    let spacing:CGFloat = 15
    var body: some View {
        ZStack {
            MonthBorder(position: $position, size: $size)
            VStack(spacing:spacing) {
               
                
                HStack (spacing:spacing){

                    Text("January")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("February")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("March")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("April")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                }
                
                
                
                HStack (spacing:spacing){
                    Text("May")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("June")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("July")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("August")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                }
                
                
                
                HStack (spacing:spacing){
                    Text("September")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("October")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("November")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                    Text("December")
                    .overlay(SelectMonthButton(position: $position, size: $size))
                }
            }
        
        }
        .animation(.default)
        .coordinateSpace(name: "month")
    }
}

struct SelectMonthButton:View {
    @Binding var position:CGPoint
    @Binding var size:CGSize
    
    fileprivate func setCoordinates(for geometry:GeometryProxy) {
        self.size = geometry.frame(in: .named("month")).size
        self.position = CGPoint(x: geometry.frame(in: .named("month")).midX, y: geometry.frame(in: .named("month")).midY)
    }
    
    var body: some View {
        GeometryReader { geometry in
            Button (action: {
                self.setCoordinates(for: geometry)
            }) {
                Rectangle().fill(Color.clear)
            }
            .onAppear {
                self.setCoordinates(for: geometry)
            }
        }
        
    }
}
struct MonthBorder: View {
    @Binding var position:CGPoint
    @Binding var size:CGSize
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3.0)
        .padding(-10)
            .foregroundColor(.red)
            .frame(width: size.width, height: size.height, alignment: .center)
            .position(x: position.x, y: position.y)
    }
}
struct GeometryExample_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

