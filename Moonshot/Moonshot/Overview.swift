//
//  Tutorial.swift
//  Moonshot
//
//  Created by Oluwapelumi Williams on 14/09/2023.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

// FOR THE EXAMPLE ON DECODING JSON
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct Overview: View {
    // Fixed Grid
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
//    ]
    
    // Adaptive Grid
    let layout = [
        GridItem(.adaptive(minimum: 80)),
    ]
    
    var body: some View {
//        Image("low-angle-man-sitting-truck")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 300, height: 300)
//            //.clipped()
        
        // ANOTHER EXAMPLE
        
//        VStack {
//            GeometryReader { geo in
//                Image("low-angle-man-sitting-truck")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geo.size.width * 0.8)
//                    .frame(width: geo.size.width, height: geo.size.height)
//            }
//
//            ScrollView (.horizontal) {
//                LazyHStack(spacing: 10) {
//                    ForEach(0..<100) {
//                        CustomText("Item \($0)")
//                            .font(.title)
//                    }
//                }
//                .frame(maxWidth: .infinity)
//            }
//
//            // VStack closing brace below
//        }
        
//        // ANOTHER EXAMPLE
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink {
//                    Text("Detail \(row)")
//                } label: {
//                    Text("Row \(row)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
        
        // EXAMPLE ON DECONDING HIERARCHICAL DATA
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
        
        // ANOTHER EXAMPLE - ON SCROLLING GRIDS
        // Scrolling vertical grid
        VStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(0..<1000) {
                        Text("Item \($0)")
                    }
                }
            }
            
            // Scrolling horizontal grid
            ScrollView (.horizontal) {
                LazyHGrid(rows: layout) {
                    ForEach(0..<1000) {
                        Text("Item \($0)")
                    }
                }
            }
        }
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
    }
}
