//
//  Endpoint.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

// 1. 엔드포인트 정의
enum Endpoint {
    case base
    // 엔드포인트에 추가 정보를 제시
    case second(id: Int)
}

extension Endpoint  {
    // 1. scheme 정의
    var scheme: String { "https" }

    var host: String { "ginger1219.com" }
    
    var path: String {
        switch self {
        case .base:
            return "/3/movie/top_rated"
        case .second(let id):
            return "/3/movie/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .base, .second:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        let accessToken = "insert your access token here -> https://www.themoviedb.org/settings/api"
        switch self {
        case .base, .second:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    // body에 이
    var body: [String: String]? {
        switch self {
        case .base, .second:
            return nil
        }
    }
}




