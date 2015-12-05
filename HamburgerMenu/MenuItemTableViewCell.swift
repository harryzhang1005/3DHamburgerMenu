//
//  MenuItemTableViewCell.swift
//  HamburgerMenu
//
//  Created by Harvey Zhang on 12/4/15.
//  Copyright © 2015 HappyGuy. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    func configureCell(menuItem: MenuItem)
    {
        self.imgView.image = UIImage(named: menuItem.imageName!)
        self.backgroundColor = menuItem.bgColor
        self.alpha = 0.75
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
