//
//  ContentView.swift
//  MenubarMemo
//
//  Created by Naoki Takahashi on 2022/09/03.
//

import SwiftUI

struct ContentView: View {
    @State private var memo = UserDefaults.standard.string(forKey: "memo") ?? ""
    
    var body: some View {
        VStack{
            TextField(memo, text: $memo)
                .onSubmit {
                    UserDefaults.standard.set(self.memo, forKey: "memo")
                }
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
