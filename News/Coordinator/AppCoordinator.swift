//
//  AppCoordinator.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import UIKit

class AppCoordinator : Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        pushNewsVC()
    }
    
    func pushNewsVC() {
        let nibName = "ArticlesViewController"
        let articlesVC = ArticlesViewController(nibName: nibName, bundle: nil)
        
        let articlesViewModel = ArticlesViewModel()
        articlesViewModel.coordinator = self
        articlesVC.setViewModel(articlesViewModel)
        
        navigationController.pushViewController(articlesVC, animated: true)
    }
    
    func pushArticelsDetailsVC(_ article: Article) {
        let nibName = "ArticleDetailsViewController"
        let articlesDetailsVC = ArticleDetailsViewController(nibName: nibName, bundle: nil)
        
        let articleDetailsViewModel = ArticelDetailsViewModel()
        articleDetailsViewModel.coordinator = self
        articleDetailsViewModel.article = article
        articlesDetailsVC.setViewModel(articleDetailsViewModel)
        
        navigationController.pushViewController(articlesDetailsVC, animated: true)
    }
}
