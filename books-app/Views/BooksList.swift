//
//  ContentView.swift
//  books-app
//
//  Created by Vu Trinh on 7/28/21.
//

import SwiftUI

struct BooksList: View {
    @EnvironmentObject var model:BookModel
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(model.books) { b in
                        NavigationLink(destination: BookAction(book: b)) {
                            BookPreview(book: b)
                                .padding([.leading, .trailing], 20)
                        }
                    }
                }
            }.navigationTitle("My Library")
        }
    }
}

struct BooksList_Previews: PreviewProvider {
    static var previews: some View {
        BooksList().environmentObject(BookModel())
    }
}
