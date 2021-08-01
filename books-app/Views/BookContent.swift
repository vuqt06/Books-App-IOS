//
//  BookContent.swift
//  books-app
//
//  Created by Vu Trinh on 8/1/21.
//

import SwiftUI

struct BookContent: View {
    @EnvironmentObject var model:BookModel
    var book:Book
    @State var cPage = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TabView(selection: $cPage) {
                ForEach(0..<book.content.count, id:\.self) {
                    index in
                    Text(book.content[index]).tag(index)
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .onChange(of: cPage, perform: { value in
                model.updateCurrentPage(forId: book.id, currentPage: cPage)
            })
            
            HStack {
                Spacer()
                Text(String(cPage + 1))
                Spacer()
            }
        }.padding(20)
        .onAppear{cPage = book.currentPage}
    }
}

struct BookContent_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookContent(book: model.books[0]).environmentObject(BookModel())
    }
}
