//
//  Constants.swift
//  kino
//
//  Created by Saida Yessirkepova on 28.01.2023.
//

import Foundation

struct Constants {
    
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
    }
    
    struct Values {

    }
    
    struct Colors {
        
    }
}

enum Category: String, CaseIterable {
    case all = "🔥All"
    case streaming = "🎥Streaming"
    case onTV = "📺On TV"
    case inTheaters = "🍿In Theaters"
}
