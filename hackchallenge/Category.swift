//
//  Category.swift
//  sw895_p5
//
//  Created by Sophia Wang on 4/30/23.
//

import Foundation

struct Category: Codable {
    let id: Int
    let description: String
    
    func getId() -> Int {
        return id;
    }
}
