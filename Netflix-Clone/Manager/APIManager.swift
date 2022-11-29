//
//  APIManager.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/12/22.
//

import Foundation

struct Constants {
    
    lazy var urlTrendingMovies: String = "https://api.themoviedb.org/3/trending/movie/day?api_key=9a2cb2c7c3da869e90e28f513464e261"
    lazy var urlUpCommingMovies: String = "https://api.themoviedb.org/3/movie/upcoming?api_key=9a2cb2c7c3da869e90e28f513464e261&language=en-US&page=1"
    lazy var urlPopularMovies:  String = "https://api.themoviedb.org/3/movie/popular?api_key=9a2cb2c7c3da869e90e28f513464e261&language=en-US&page=1"
    lazy var urlRatedMovies: String = "https://api.themoviedb.org/3/movie/top_rated?api_key=9a2cb2c7c3da869e90e28f513464e261&language=en-US&page=1"
    
    static let urlBase: String = "https://api.themoviedb.org/"
    static let API_Key: String = "9a2cb2c7c3da869e90e28f513464e261"
    static let trendingMovies:String = "3/trending/movie/day?api_key="
    static let trendingTvs: String = "3/trending/tv/day?api_key="
    static let upCommingMovies: String = "3/movie/upcoming?api_key="
    static let upCommingTvs: String = "3/tv/upcomming?api_key="
    static let popularMovies: String = "3/movie/popular?api_key="
    static let popularTvs: String = "3/tv/popular?api_key="
    static let ratedMovies: String = "3/movie/top_rated?api_key="	
    static let ratedTvs: String = "3/tv/top_rated?api_key="
    
}

enum APIError: Error {
    case failedRequest
}

final class APIManager {
    
    static let shared = APIManager()
    
    func getTrendingMovies(completition: @escaping (Result<[MovieOrTv], Error>) -> Void) {
        guard let url = URL(string: Constants.urlBase + Constants.trendingMovies + Constants.API_Key) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode(MovieOrTvRequest.self, from: data)
                completition(.success(result.MoviesOrTvs))
            } catch {
                completition(.failure(APIError.failedRequest))
            }
        }.resume()
    }
    
    func getTrendingTvs(completition: @escaping (Result<[MovieOrTv], Error>) -> Void) {
        guard let url = URL(string: Constants.urlBase + Constants.trendingTvs + Constants.API_Key) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode(MovieOrTvRequest.self, from: data)
                completition(.success(result.MoviesOrTvs))
            } catch { completition(.failure(APIError.failedRequest)) }
        }.resume()
    }
    
    func getUpCommingMovies(completition: @escaping (Result<[MovieOrTv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.urlBase + Constants.upCommingMovies + Constants.API_Key)&language=en-US&page=1") else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else { return }
                do {
                    let result = try JSONDecoder().decode(MovieOrTvRequest.self, from: data)
                    completition(.success(result.MoviesOrTvs))
                } catch { completition(.failure(error)) }
        }.resume()
    }
    
    func getPopularMovies(completition: @escaping (Result<[MovieOrTv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.urlBase + Constants.popularMovies + Constants.API_Key)&language=en-US&page=1") else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else { return }
                do {
                    let result = try JSONDecoder().decode(MovieOrTvRequest.self, from: data)
                    completition(.success(result.MoviesOrTvs))
                } catch { completition(.failure(APIError.failedRequest)) }
        }.resume()
    }
    
    func getRatedMovies(completition: @escaping (Result<[MovieOrTv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.urlBase + Constants.ratedMovies + Constants.API_Key)&language=en-US&page=1") else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode(MovieOrTvRequest.self, from: data)
                completition(.success(result.MoviesOrTvs))
            } catch { completition(.failure(APIError.failedRequest)) }
        }.resume()
    }
    
}
