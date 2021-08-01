//
//  BookAction.swift
//  books-app
//
//  Created by Vu Trinh on 7/30/21.
//

import SwiftUI

struct BookAction: View {
    @EnvironmentObject var model:BookModel
    var book:Book
    @State var rating = 2
    var body: some View {
            VStack {
                Spacer()
                NavigationLink(
                    destination: BookContent(book: book),
                    label: {
                        VStack {
                            Text("Read Now!")
                                .font(.title)
                                .foregroundColor(.black)
                            Image("cover" + String(book.id))
                                .resizable()
                                .clipped()
                                .aspectRatio(contentMode: .fit)
                        }.padding(20)
                    })
                
                Spacer()
                VStack {
                    Text("Mark for later!")
                        .bold()
                        .font(.headline)
                    Button(action: {
                        model.updateFavourite(forId: book.id)
                    }, label: {
                        Image(systemName: book.isFavourite ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.yellow)
                    })
                }.padding(15)
                Spacer()
                VStack {
                    Text("Rate \(book.title)")
                        .bold()
                    Picker("", selection: $rating) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                    }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: rating, perform: { value in
                        model.updateRating(forId: book.id, rating: rating)
                    })
                    .frame(width: 250)
                    
                }.padding(15)
                Spacer()
            }.onAppear {rating = book.rating}
            .navigationBarTitle("\(book.title)")
    }
}

struct BookAction_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookAction(book: model.books[0]).environmentObject(BookModel())
    }
}
