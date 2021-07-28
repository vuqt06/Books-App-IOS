//
//  BookModels.swift
//  books-app
//
//  Created by Vu Trinh on 7/28/21.
//

import Foundation

class BooksModel: ObservableObject {
    @Published var books = [Book]()
    
    init() {
        self.books = DataService.getLocalData()
    }
}
