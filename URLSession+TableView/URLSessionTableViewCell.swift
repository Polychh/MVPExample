//
//  URLSessionTableViewCell.swift
//  URLSession+TableView
//
//  Created by USER on 31.08.2023.
//

import UIKit

class URLSessionTableViewCell: UITableViewCell {
    
    static var id = "URLSessionTableViewCell"

    @IBOutlet weak var labelCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
