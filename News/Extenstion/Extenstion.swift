//
//  Extenstion.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import UIKit

extension UIImageView {
    func loadImage(_ path: String) {
        let url = URL(string: path)!
        self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder-image"))
    }
}
