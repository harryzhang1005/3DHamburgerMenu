# 3DHamburgerMenu
Cool 3D Hamburger Menu effect - Swift 2.1 &amp; Xcode 7.1.1

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
