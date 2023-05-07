//
//  ContentView.swift
//  Memorize
//
//  Created by Amalia Gimranova on 04.05.2023.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗", "🚀", "✈️", "🚁", "🚂", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚜", "🚲", "🏍️", "🛶", "🛸", "🚢", "🚄"]
    @State var countCards = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<countCards], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button(action: {
            if countCards > 1 {
                countCards -= 1
            }
        }, label: {Image(systemName: "minus.circle")})
    }
    var add: some View {
        Button(action: {
            if countCards < emojis.count {
                countCards += 1
        }
        }, label: {Image(systemName: "plus.circle")})
    }
}

struct CardView: View {
    
    @State var isCardUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isCardUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isCardUp = !isCardUp
        }
    }
}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}


