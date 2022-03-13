//
//  ArticleDetailsViewController.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import UIKit
import SDWebImage

class ArticleDetailsViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var viewModel: ArticelDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    
    func setViewModel(_ viewModel: ArticelDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupUI() {
        guard let viewModel = viewModel else { return }
        lblTitle.text = viewModel.article?.title
        lblContent.text = viewModel.article?.content
        image.loadImage(viewModel.article?.urlToImage ?? "")
    }
}
