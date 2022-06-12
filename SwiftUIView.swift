//
//  SwiftUIView.swift
//  scannerApp
//
//  Created by Vladica Kostic on 9.6.22..
//

import SwiftUI

struct SwiftUIView: View {
    private let values: [StartData] = [
            StartData(name: "John", age: 24, gender: "Male"),
            StartData(name: "Katherine", age: 25, gender: "Female"),
            StartData(name: "Jonas", age: 21, gender: "Male")
        ]
    var body: some View {
            List {
                ForEach(values){ item in
                    Text(item.name)
                }
            }
        }
}

struct StartData: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var gender: String
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
