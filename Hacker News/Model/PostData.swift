//
//  Data.swift
//  Hacker News
//
//  Created by Khater on 8/28/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import Foundation

struct PostData: Decodable{
    let hits: [Hits]
}

struct Hits: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
