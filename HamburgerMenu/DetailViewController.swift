//
//  DetailViewController.swift
//  HamburgerMenu
//
//  Created by Harvey Zhang on 12/4/15.
//  Copyright © 2015 HappyGuy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var menuItem: MenuItem! {
        didSet {
            if menuItem != nil {
                updateUI()
            }
        }
    }
    
    func updateUI()
    {
        self.imageView.image = UIImage(named: menuItem.bigImageName!)
        self.view.backgroundColor = menuItem.bgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburger"), style: UIBarButtonItemStyle.Plain, target: self, action: "toggleMenuList")
    }
    
    func toggleMenuList()
    {
        (self.parentViewController?.parentViewController as? ViewController)?.hideOrShowMenuView()
    }

}
