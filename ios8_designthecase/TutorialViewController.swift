
//
//  TutorialViewController.swift
//  ios8_designthecase
//
//  Created by Stanley Ng on 10/10/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate, UIActionSheetDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameImageView: UIImageView!
    @IBOutlet weak var remarkImageView: UIImageView!
    @IBOutlet weak var yosImageView: UIImageView!
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("TutorialViewController - viewDidLoad()")
        
        contentView.sizeToFit()
        scrollView.contentSize = contentView.frame.size
        scrollView.delegate = self
        
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onTap:")
        scrollView.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func onClose(sender: AnyObject) {
        var sheet: UIActionSheet = UIActionSheet();
        let title: String = "Please choose an option";
        sheet.title  = title;
        sheet.delegate = self;
        sheet.addButtonWithTitle("Cancel");
        sheet.addButtonWithTitle("Thumb-Up");
        sheet.addButtonWithTitle("Thumb-Down");
        sheet.cancelButtonIndex = 0;
        sheet.showInView(self.view);
    }
    
    func actionSheet(sheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int) {
        println("index %d %@", buttonIndex, sheet.buttonTitleAtIndex(buttonIndex));
        
        if buttonIndex != 0 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func onTap(tapGestureRecognizer: UITapGestureRecognizer) {
        println("TutorialViewController - onTap - index: \(index)")

        if index == 0 {
            avatarImageView.alpha = 0.8
            UIView.animateWithDuration(1,
                animations: { () -> Void in
                    
                    self.avatarImageView.alpha = 0
                    
                },
                completion: { (isDone:Bool) -> Void in

                    self.avatarImageView.image = UIImage(named: "avatar-female")
                    UIView.animateWithDuration(1,
                        animations: { () -> Void in
                
                            self.avatarImageView.alpha = 0.8
                    
                        }, completion: nil)
                }
            )
        }
        else if index == 1 {
            avatarImageView.alpha = 0.8
            UIView.animateWithDuration(1,
                animations: { () -> Void in
                    
                    self.avatarImageView.alpha = 0
                    
                },
                completion: { (isDone:Bool) -> Void in
                    
                    self.avatarImageView.image = UIImage(named: "avatar-flickr")
                    self.nameImageView.image = UIImage(named: "name-flickr")
                    UIView.animateWithDuration(1,
                        animations: { () -> Void in
                            
                            self.avatarImageView.alpha = 0.8
                            self.nameImageView.alpha = 0.8
                            
                        }, completion: nil)
                }
            )
        }
        else if index == 2 {
            avatarImageView.alpha = 0.8
            nameImageView.alpha = 0.8
            UIView.animateWithDuration(1,
                animations: { () -> Void in
                    
                    self.avatarImageView.alpha = 0
                    self.nameImageView.alpha = 0
                    
                },
                completion: { (isDone:Bool) -> Void in
                    
                    self.avatarImageView.image = UIImage(named: "avatar-stanleyn")
                    self.nameImageView.image = UIImage(named: "name-stanleyn")
                    UIView.animateWithDuration(1,
                        animations: { () -> Void in
                            
                            self.avatarImageView.alpha = 0.8
                            self.nameImageView.alpha = 0.8
                            self.remarkImageView.alpha = 0.8
                            
                        }, completion: nil)
                }
            )
        }
        else if index == 3 {
            avatarImageView.alpha = 0.8
            nameImageView.alpha = 0.8
            remarkImageView.alpha = 0.8
            UIView.animateWithDuration(1,
                animations: { () -> Void in
                    
                    self.avatarImageView.alpha = 0
                    self.nameImageView.alpha = 0
                    self.remarkImageView.alpha = 0
                    
                },
                completion: { (isDone:Bool) -> Void in
                    
                    self.avatarImageView.image = UIImage(named: "avatar-filo")
                    self.nameImageView.image = UIImage(named: "name-filo")
                    self.remarkImageView.image = UIImage(named: "remark-social")
                    UIView.animateWithDuration(1,
                        animations: { () -> Void in
                            
                            self.avatarImageView.alpha = 0.8
                            self.nameImageView.alpha = 0.8
                            self.remarkImageView.alpha = 0.8
                            self.yosImageView.alpha = 0.8
                            
                        }, completion: nil)
                }
            )
        }
        
        index++
    }
    
    // MARK: - UIScrollViewDelegate methods
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        println("TutorialViewController - scrollViewDidEndDecelerating")
        
        // Get the current page based on the scroll offset
        var page: Int = Int(round(scrollView.contentOffset.x / 320))
        println("page = \(page)")
        
//        // Set the current page, so the dots will update
//        pageControl.currentPage = page
//        
//        // Show / Hide button
//        UIView.animateWithDuration(0.4, animations: { () -> Void in
//            if page == 3 {
//                self.actionsView.alpha = 1
//            }
//            else {
//                self.actionsView.alpha = 0
//            }
//        })
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
