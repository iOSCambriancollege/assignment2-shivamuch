//
//  DogCell.swift
//  A2_WebServices
//
//  Created by Shivam Bajaj on 2023-02-01.
//

import Foundation

import UIKit


class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
