//
//  ViewController.swift
//  HamburgerMenu
//
//  Created by Harvey Zhang on 12/3/15.
//  Copyright © 2015 HappyGuy. All rights reserved.
//

import UIKit

// Main container view controller
class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!    // left is menu view, right is detail view
    
    var menuItem: MenuItem! {
        didSet {
            if let detailViewController = detailVC {
                detailViewController.menuItem = menuItem
                
                hideOrShowMenuView()
            }
        }
    }
    
    private var detailVC: DetailViewController!
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var detailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        
        menuView.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)    // menu view right edge
        
        hideOrShowMenuView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailVC" {
            let navi = segue.destinationViewController as! UINavigationController
            detailVC = navi.topViewController as? DetailViewController
            detailVC.menuItem = menuItem
        }
    }
    
    func hideOrShowMenuView()
    {
        let x = (scrollView.contentOffset.x > 0) ? 0 : CGRectGetWidth(menuView.bounds)
        let p = CGPoint(x: x, y: 0)
        scrollView.setContentOffset(p, animated: true)  // will trigger - scrollViewDidScroll method
    }

}

// MARK: - Scroll View Delegate method

extension ViewController: UIScrollViewDelegate
{
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let multiplier = 1.0 / CGRectGetWidth(menuView.bounds)
        
        // contentOffset - The point at which the origin of the content view is offset from the origin of the scroll view.
        let fraction = scrollView.contentOffset.x * multiplier  // fraction, 0 means completely visible, 1 means hidden
        
        menuView.layer.transform = menu3DTransform(fraction)
    }
    
    func menu3DTransform(fraction: CGFloat) -> CATransform3D
    {
        // 3D Rotation
        var identity = CATransform3DIdentity
        identity.m34 = -1.0/500.0
        let angle = fraction * CGFloat(-M_PI_2)
        let rotateTransform = CATransform3DRotate(identity, angle, 0.0, 1.0, 0.0)
        
        // 3D Translation
        let xOffset = CGRectGetWidth(menuView.bounds)/2
        let translateTranfrom = CATransform3DMakeTranslation(xOffset, 0.0, 0.0)
        
        // Combine rotation and translation
        return CATransform3DConcat(rotateTransform, translateTranfrom)
    }
    
}
