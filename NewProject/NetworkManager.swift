//
//  NetworkManager.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

final class NetworkManager {
    static var shared = NetworkManager()
    
    // POST, GET을 나누어서 실행할 수 있어야 하는데 너무 불편하다.
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type, data : Data? = nil) async -> Result<T, RequestError> {
        // 1. url 조립
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        // 2. URL 유효성 확인
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        // 3. URLRequest 객체 생성
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        // 4. httpBody 생성(데이터를 전달받았다면 데이터를 이용)
        if let data = data {
            request.httpBody = data
        } else if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        // 4. Network 통신 수행
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}

// 2. 서비스 정의
//protocol MoviesServiceable {
//    func getTopRated() async -> Result<TopRated, RequestError>
//    func getMovieDetail(id: Int) async -> Result<Movie, RequestError>
//}
//
//struct MoviesService: HTTPClient, MoviesServiceable {
//    func getTopRated() async -> Result<TopRated, RequestError> {
//        return await sendRequest(endpoint: MoviesEndpoint.topRated, responseModel: TopRated.self)
//    }
//
//    func getMovieDetail(id: Int) async -> Result<Movie, RequestError> {
//        return await sendRequest(endpoint: MoviesEndpoint.movieDetail(id: id), responseModel: Movie.self)
//    }
//}

// 3. HTTPClient의 활용
//Task(priority: .background) {
//  let result = await service.getMovieDetail(id: movie.id)
//  switch result {
//  case .success(let movieResponse):
//    showModal(
//      title: movieResponse.originalTitle,
//      message: movieResponse.overview
//    )
//  case .failure(let error):
//    showModal(title: "Error", message: error.customMessage)
//  }
//}
