//
//  PhotoModel.swift
//  Task24
//
//  Created by ana namgaladze on 08.05.24.
//

//import Foundation
//
//struct Photo: Decodable, Hashable {
//    let id: String
//    let urls: URLs
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: Photo, rhs: Photo) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
// 
//struct URLs: Decodable {
//    let regular: String
//}
import Foundation

struct Photo: Decodable, Hashable {
    let id: String
    let urls: URLs
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
 
struct URLs: Decodable {
    let regular: String
}
