//
//  Books.swift
//  books-app
//
//  Created by Vu Trinh on 7/28/21.
//

import Foundation

class Book: Identifiable, Decodable {
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:Int
    var content:[String]
}
