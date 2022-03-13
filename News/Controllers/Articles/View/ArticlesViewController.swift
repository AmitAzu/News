//
//  NewsViewController.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: ArticlesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDidEnterBackgroundNotification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        callToViewModelForUIUpdate()
    }
    
    func setViewModel(_ viewModel: ArticlesViewModel) {
        self.viewModel = viewModel
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func callToViewModelForUIUpdate() {
        viewModel?.bindArticlesViewModelToController = {
            self.setupTableView()
        }
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "ArticlesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ArticlesTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self

        tableView.reloadData()
    }
    
    private func addDidEnterBackgroundNotification() {
        let notification = UIApplication.didEnterBackgroundNotification
        NotificationCenter.default.addObserver(forName: notification, object: nil, queue: nil) { (notification) in
            self.callToViewModelForUIUpdate()
        }
    }
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell", for: indexPath) as! ArticlesTableViewCell
        
        let articel = viewModel!.articles[indexPath.row]
        cell.configureCell(articel: articel)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel!.coordinator?.pushArticelsDetailsVC(viewModel!.articles[indexPath.row])
    }
}
