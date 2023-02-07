//
//  APICaller.swift
//  kino
//
//  Created by Saida Yessirkepova on 05.02.2023.
//

import Foundation

protocol APICallerDelegate {
    func didUpdateMovieList(with movieList: [MovieModel])
    func didFailWithError(_ error: Error)
}
protocol APICallerDelegate2 {
    func didUpdateMovieList(with nowMovieList: [MovieModel])
    func didFailWithError(_ error: Error)
}

struct APICaller {
    
    var delegate: APICallerDelegate?
    var delegate2: APICallerDelegate2?
    
    func fetchRequest() {
        
        let urlString = Constants.Links.trendingURL
        guard let url = URL(string: urlString) else { fatalError("Inccorect link!") }
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            if let data, error == nil {
                if let movieList = parseJSON(data) {
                    delegate?.didUpdateMovieList(with: movieList)
                } else {
                    delegate?.didFailWithError(error!)
                }
            } else {
                delegate?.didFailWithError(error!)
            }
        }
        task.resume()
    }
    
    func fetchData() {
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=885e64952226ae55ffa721f88015d481&language=en-US&page=1"
        guard let url = URL(string: urlString) else { fatalError("Incorrect link!")}
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            if let data, error == nil {
                if let nowMovieList = parseJSON(data) {
                    delegate2?.didUpdateMovieList(with: nowMovieList)
                } else {
                    delegate2?.didFailWithError(error!)
                }
            } else {
                delegate2?.didFailWithError(error!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> [MovieModel]? {
        var movieList: [MovieModel] = []
        do {
            let decodedData = try JSONDecoder().decode(MovieData.self, from: data)
            for movie in decodedData.results {
                let movieModel = MovieModel(adult: movie.adult, backdropPath: movie.backdrop_path, id: movie.id, title: movie.title, description: movie.overview, posterPath: movie.poster_path, genreIds: movie.genre_ids, releaseDate: movie.release_date, voteAverage: movie.vote_average)
                movieList.append(movieModel)
            }
        } catch {
            print(error)
            return nil
        }
        return movieList
    }
    
    func parseJSON2(_ data: Data) -> [MovieModel]? {
        var nowMovieList: [MovieModel] = []
        do {
            let decodedData = try JSONDecoder().decode(MovieData.self, from: data)
            for movie in decodedData.results {
                let movieModel = MovieModel(adult: movie.adult, backdropPath: movie.backdrop_path, id: movie.id, title: movie.title, description: movie.overview, posterPath: movie.poster_path, genreIds: movie.genre_ids, releaseDate: movie.release_date, voteAverage: movie.vote_average)
                nowMovieList.append(movieModel)
            }
        } catch {
            print(error)
            return nil
        }
        return nowMovieList
    }
}
