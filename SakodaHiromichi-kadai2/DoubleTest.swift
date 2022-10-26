//
//  DoubleTest.swift
//  SakodaHiromichi-kadai2
//
//  Created by sako0602 on 2022/10/25.
//

import SwiftUI

struct DoubleTest: View {
    var value1:Double = 1.234
    var value2:Double = 4.567
    @State var total:Double = 0.0
    var body: some View {
        VStack{
            Button {
                total = value1 / value2
            } label: {
                Text("button")
            }

            Text("\((String(format: "%.1f", total)))")
        }
        
    }
}

struct DoubleTest_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTest()
    }
}
