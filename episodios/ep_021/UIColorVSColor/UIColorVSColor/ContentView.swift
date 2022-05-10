//
//  ContentView.swift
//  UIColorVSColor
//
//  Created by Diego Freniche Brito on 6/5/22.
//

import SwiftUI

let colors1: [UIColor] = [.blue, .green, .orange, .red, .purple, .brown, .gray] // UIKit
let colors2: [UIColor] = [.systemBlue, .systemGreen, .systemOrange, .systemRed, .systemPurple, .systemBrown, .systemGray] // UIKit System
let colors3: [Color] = [.blue, .green, .orange, .red, .purple, .brown, .gray] // SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 5) {
            VStack(spacing: 2) {
                ForEach(colors1, id: \.self) { color in
                    Text("UIKit")
                        .foregroundColor(.white)
                        .frame (maxWidth: .infinity, minHeight: 64)
                        .background(Color(color))
                }
            }
            VStack(spacing: 2) {
                ForEach(colors2, id: \.self) { color in
                    Text("UIKit System")
                        .foregroundColor(.white)
                        .frame (maxWidth: .infinity, minHeight: 64)
                        .background(Color(color))
                }
            }
            VStack(spacing: 2) {
                ForEach(colors3, id: \.self) { color in
                    Text("SwiftUI")
                        .foregroundColor(.white)
                        .frame (maxWidth: .infinity, minHeight: 64)
                        .background(color)
                }
            }
        }.onAppear() {
            print("Colors 1")
            let _ = colors1.map { (color: UIColor) in
                describeColor(color)
            }
            
            print("Colors 2")
            let _ = colors2.map { (color: UIColor) in
                describeColor(color)
                
            }
            
            print("Colors 3")
            let _ = colors3.map { (color: Color) in
                describeColor(UIColor(color))
            }
        }
    }
}

func describeColor(_ color: UIColor) {
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    
    print("\( color ) extracted RGB: \( color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) )")
    print("\(red) \(green) \(blue)")
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Colors 1
//UIExtendedSRGBColorSpace 0 0 1 1 extracted RGB: true
//0.0 0.0 1.0
//UIExtendedSRGBColorSpace 0 1 0 1 extracted RGB: true
//0.0 1.0 0.0
//UIExtendedSRGBColorSpace 1 0.5 0 1 extracted RGB: true
//1.0 0.5 0.0
//UIExtendedSRGBColorSpace 1 0 0 1 extracted RGB: true
//1.0 0.0 0.0
//UIExtendedSRGBColorSpace 0.5 0 0.5 1 extracted RGB: true
//0.5 0.0 0.5
//UIExtendedSRGBColorSpace 0.6 0.4 0.2 1 extracted RGB: true
//0.6 0.4 0.2
//UIExtendedGrayColorSpace 0.5 1 extracted RGB: true
//0.5 0.5 0.5


//Colors 2
//<UIDynamicSystemColor: 0x600001935600; name = systemBlueColor> extracted RGB: true
//0.0 0.47843137254901963 1.0
//<UIDynamicSystemColor: 0x60000197de00; name = systemGreenColor> extracted RGB: true
//0.20392156862745098 0.7803921568627451 0.34901960784313724
//<UIDynamicSystemColor: 0x60000197e100; name = systemOrangeColor> extracted RGB: true
//1.0 0.5843137254901961 0.0
//<UIDynamicSystemColor: 0x60000197e2c0; name = systemRedColor> extracted RGB: true
//1.0 0.23137254901960785 0.18823529411764706
//<UIDynamicSystemColor: 0x60000197e480; name = systemPurpleColor> extracted RGB: true
//0.6862745098039216 0.3215686274509804 0.8705882352941177
//<UIDynamicSystemColor: 0x60000197e640; name = systemBrownColor> extracted RGB: true
//0.6352941176470588 0.5176470588235295 0.3686274509803922
//<UIDynamicSystemColor: 0x60000197e780; name = systemGrayColor> extracted RGB: true
//0.5568627450980392 0.5568627450980392 0.5764705882352941



//Colors 3
//<UIDynamicProviderColor: 0x600000c43c80; provider = <__NSMallocBlock__: 0x60000023f6f0>> extracted RGB: true
//0.0 0.4784314036369324 0.9999999403953552
//<UIDynamicProviderColor: 0x600000c43c80; provider = <__NSMallocBlock__: 0x60000023f6f0>> extracted RGB: true
//0.20392152667045593 0.7803921699523926 0.3490195870399475
//<UIDynamicProviderColor: 0x600000c43c80; provider = <__NSMallocBlock__: 0x60000023f6f0>> extracted RGB: true
//0.9999999403953552 0.5843137502670288 0.0
//<UIDynamicProviderColor: 0x600000c43c80; provider = <__NSMallocBlock__: 0x60000023f6f0>> extracted RGB: true
//0.9999999403953552 0.23137253522872925 0.18823528289794922
//<UIDynamicProviderColor: 0x600000c43c80; provider = <__NSMallocBlock__: 0x60000023f6f0>> extracted RGB: true
//0.686274528503418 0.32156863808631897 0.8705882430076599
//<UIDynamicProviderColor: 0x600000c7a380; provider = <__NSMallocBlock__: 0x6000002040f0>> extracted RGB: true
//0.6352941393852234 0.5176470279693604 0.3686274588108063
//<UIDynamicProviderColor: 0x600000c55000; provider = <__NSMallocBlock__: 0x6000002203f0>> extracted RGB: true
//0.5568627715110779 0.5568627715110779 0.5764706134796143
