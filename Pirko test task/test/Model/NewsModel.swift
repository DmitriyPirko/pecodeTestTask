//
//  NewsModel.swift
//  test
//
//  Created by Dmitriy on 16.02.2021.
//

import Foundation

struct Source: Codable {
    var id: String!
    var name: String!
}

struct Article: Codable {
    var source: Source!
    var author: String!
    var title: String!
    var description: String!
    var url: URL!
    var urlToImage: URL!
    var publishedAt: String!
    var content: String!
}

class NewsItem: Codable {
    var status: String!
    var totalResults: Int!
    var articles: [Article]!
}
