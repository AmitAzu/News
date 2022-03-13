//
//  ArticlesTableViewCell.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    func configureCell(articel: Article) {
        self.lblTitle.text = articel.title
    }
}
