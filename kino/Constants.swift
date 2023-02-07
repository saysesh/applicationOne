//
//  Constants.swift
//  kino
//
//  Created by Saida Yessirkepova on 28.01.2023.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let api = "885e64952226ae55ffa721f88015d481"
    }
    
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
        static let movieCollectionViewCell = "MovieCollectionViewCell"
    }
    
    struct Values {

    }
    
    struct Colors {
        
    }
    
    struct Links {
        static let apiURL = "https://api.themoviedb.org/3/"
        static let trendingURL = "\(apiURL)trending/movie/day?api_key=\(Keys.api)"
        static let imageURL = "https://image.tmdb.org/t/p/w500/" //+ poster path
        static let movieUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=885e64952226ae55ffa721f88015d481&language=en-US&page=1"
        
//       https://api.themoviedb.org/3/trending/movie/day?api_key=885e64952226ae55ffa721f88015d481
        
    }
}

enum Category: String, CaseIterable {
    case all = "🔥All"
    case streaming = "🎥Streaming"
    case onTV = "📺On TV"
    case inTheaters = "🍿In Theaters"
}
