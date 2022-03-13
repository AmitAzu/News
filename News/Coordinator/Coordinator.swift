//
//  Coordinator.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import UIKit

protocol Coordinator {

    var navigationController : UINavigationController { get set }
    
    func start()
}
