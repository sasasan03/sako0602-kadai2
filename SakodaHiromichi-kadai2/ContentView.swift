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
            let add = num1 + num2
            return String(format: "%.1f", add)
        case 1:
            let subtraction = num1 - num2
            return String(format: "%.1f", subtraction)
            
        case 2:
            let multiplication = num1 * num2
            return String(format: "%.1f", multiplication)
        case 3:
            if num1 == 0 || num2 == 0 {
                total = "割る数には0以外を入力してください"
                return total
            } else {
                let division = num1 / num2
                return String(format: "%.1f", division)
            }
            
        default :
            fatalError("エラーが発生しました。")
            //            break
            //            let add = num1 + num2
            //            return add
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
