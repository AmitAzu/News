//
//  Article.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import Foundation

struct Articles: Codable {
    let articles: [Article]?
    let status: String?
    let totalResults: Int?
}

struct Article: Codable {
    let source: Source?
    let author, title, description, url, urlToImage, publishedAt, content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
