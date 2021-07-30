//
//  BookPreview.swift
//  books-app
//
//  Created by Vu Trinh on 7/29/21.
//

import SwiftUI

struct BookPreview: View {
    @EnvironmentObject var model:BookModel
    var book:Book
    
    var body: some View {
            
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(book.title)
                            .font(.title)
                            .bold()
                        Spacer()
                        
                        Button(action: {
                            model.updateFavourite(forId: book.id)
                        }, label: {
                            Image(systemName: book.isFavourite ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.yellow)
                        })
                    }
                    .padding(.bottom, 5)
                    Text(book.author)
                        .italic()
                    Image("cover" + String(book.id))
                        .resizable()
                        .scaledToFit()
                }.padding(20)
            }
            .cornerRadius(5)
            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
            .padding(20)
            .accentColor(.black)
        
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookPreview(book: model.books[0]).environmentObject(BookModel())
    }
}
