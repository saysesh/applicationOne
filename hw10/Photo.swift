//
//  Photo.swift
//  hw10
//
//  Created by Saida Yessirkepova on 23.01.2023.
//

import Foundation
struct photoBank {
    static func allPhotos() -> [Photo] {
        [
            .init(id: 1, imageName: "1"),
            .init(id: 2, imageName: "2"),
            .init(id: 3, imageName: "3"),
            .init(id: 4, imageName: "4"),
            .init(id: 5, imageName: "5"),
            .init(id: 6, imageName: "6")
        
        ]
    }
}

struct Photo {
    let id: Int
    let imageName: String
}
