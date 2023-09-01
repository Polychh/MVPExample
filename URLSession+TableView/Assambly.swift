//
//  Assambly.swift
//  URLSession+TableView
//
//  Created by USER on 01.09.2023.
//

import UIKit

class Assambly: NSObject {
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
        guard let view = viewController as? ViewController else { return }
        
        let presenter = Presenter()
        presenter.getAlbum()

        presenter.delegate = view
        view.userActionDelegate = presenter

    }
}
