//
//  DataServices.swift
//  books-app
//
//  Created by Vu Trinh on 7/28/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Book] {
        
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        guard pathString != nil else {
            return [Book]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                let booksData = try decoder.decode([Book].self, from: data)
                
                return booksData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Book]()
    }
}
