
//
//  IntroViewController.swift
//  ios8_designthecase
//
//  Created by Stanley Ng on 10/10/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tile1View: UIImageView!  // AVATAR
    @IBOutlet weak var tile2View: UIImageView!  // YAHOO
    @IBOutlet weak var tile3View: UIImageView!  // @
    @IBOutlet weak var tile4View: UIImageView!  // HEART
    @IBOutlet weak var tile5View: UIImageView!  // I
    @IBOutlet weak var tile6View: UIImageView!  // L (LOVE)
    @IBOutlet weak var tile7View: UIImageView!  // O (LOVE)
    @IBOutlet weak var tile8View: UIImageView!  // V (LOVE)
    @IBOutlet weak var tile9View: UIImageView!  // E (LOVE)
    @IBOutlet weak var tile10View: UIImageView! // M (MY)
    @IBOutlet weak var tile11View: UIImageView! // Y (MY)
    
    var yOffsets : [Float] = [-285, -740, -480, -408, -500, -400, -400, -400, -400,
        -640, -640]
    var xOffsets : [Float] = [-30, 75, -45, 10, 200, 180, 180, 180, 180,
        5, 5]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65, 1.65, 1.65, 1.65,
        1.7, 1.7]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10, -10, -10, -10,
        10, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("IntroViewController.viewDidLoad")
        
        contentView.sizeToFit()
        scrollView.contentSize = contentView.frame.size
        scrollView.delegate = self
        
        transformView(tile1View, atIndex: 0, offset: 0)
        transformView(tile2View, atIndex: 1, offset: 0)
        transformView(tile3View, atIndex: 2, offset: 0)
        transformView(tile4View, atIndex: 3, offset: 0)
        transformView(tile5View, atIndex: 4, offset: 0)
    
        transformView(tile6View, atIndex: 5, offset: 0)
        transformView(tile7View, atIndex: 6, offset: 0)
        transformView(tile8View, atIndex: 7, offset: 0)
        transformView(tile9View, atIndex: 8, offset: 0)

        transformView(tile10View, atIndex: 9, offset: 0)
        transformView(tile11View, atIndex: 10, offset: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view: UIView!, atIndex index: Int, offset: Float) {
        var tx = convertValue(offset, r1Min: 0, r1Max: 507, r2Min: xOffsets[index], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 507, r2Min: yOffsets[index], r2Max: 0)
        view.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        
//        var s = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[index], r2Max: 1)
//        view.transform = CGAffineTransformScale(view.transform, CGFloat(s), CGFloat(s))
//        
//        var r = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[index], r2Max: 0)
//        view.transform = CGAffineTransformRotate(view.transform, CGFloat(Double(r) * M_PI / 180))
    }

    // UIScrollViewDelegate methods
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)
        
        println("IntroViewController - scrollViewDidScroll: offset.y = \(offset)")
        
        // avatar
        transformView(tile1View, atIndex: 0, offset: offset)
        transformView(tile2View, atIndex: 1, offset: offset)
        transformView(tile3View, atIndex: 2, offset: offset)
        transformView(tile4View, atIndex: 3, offset: offset)
        transformView(tile5View, atIndex: 4, offset: offset)
        
        transformView(tile6View, atIndex: 5, offset: offset)
        transformView(tile7View, atIndex: 6, offset: offset)
        transformView(tile8View, atIndex: 7, offset: offset)
        transformView(tile9View, atIndex: 8, offset: offset)
        
        transformView(tile10View, atIndex: 9, offset: offset)
        transformView(tile11View, atIndex: 10, offset: offset)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
