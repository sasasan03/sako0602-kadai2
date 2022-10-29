//
//  ContentView.swift
//  SakodaHiromichi-kadai2
//
//  Created by sako0602 on 2022/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var numText1 = ""
    @State var numText2 = ""
    
    @State var total = "0"
    @State var selection = 0

    var body: some View {
        VStack{
            HStack{
                TextField("", text: $numText1)
                    .frame(width: 50, height: 30)
                    .border(Color.black)
                    .padding()
                Spacer()
            }
            HStack{
                TextField("", text: $numText2)
                    .frame(width: 50, height: 30)
                    .border(Color.black)
                    .padding()
                Spacer()
            }
            
            Picker(selection: $selection) {
                Text("+").tag(0)
                Text("-").tag(1)
                Text("×").tag(2)
                Text("÷").tag(3)
            } label: {
                Text("cal")
            }.pickerStyle(.segmented)
            Button {
                total = calculation()
            } label: {
                Text("Button")
            }
            Text(total)
        }
        
    }
    
    func calculation() -> String {
        let num1 = (Double(numText1)) ?? 0
        let num2 = (Double(numText2)) ?? 0

        switch selection {
        case 0:
            return String(format: "%.1f", num1 + num2)
        case 1:
            return String(format: "%.1f", num1 - num2)
        case 2:
            return String(format: "%.1f", num1 * num2)
        case 3:
            if num2 == 0 {
                return "割る数には0以外を入力してください"
            } else {
                return String(format: "%.1f", num1 / num2)
            }
        default :
            fatalError("selectionが異常です")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
