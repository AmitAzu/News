//
//  ArticlesViewModel.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import Foundation

class ArticlesViewModel: NSObject {
    
    weak var coordinator: AppCoordinator?
    var bindArticlesViewModelToController: DefualtComletion = {}

    private(set) var articles: [Article]! {
        didSet {
            self.bindArticlesViewModelToController()
        }
    }
    
    override init() {
        super.init()
        callGetArticles()
    }
    
    func callGetArticles() {
        APIService.shared.apiToGetData { (articles: Articles) in
            self.articles = articles.articles
        }
    }
    
    func didTapOn(article: Article) {
        coordinator?.pushArticelsDetailsVC(article)
    }
    
}
