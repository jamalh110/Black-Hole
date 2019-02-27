//
//  HowToPlayViewController.swift
//  Black hole
//
//  Created by guest  on 7/31/16.
//  Copyright © 2016 lithium llamas. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {
    var scrollView = UIScrollView()
    var backButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.blackColor()
        //scrollView.contentSize = imageView.bounds.size
        scrollView.contentSize = CGSize(width: view.bounds.width,height: 1000)
        //scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        backButton = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 50))
        backButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backButton.setTitle("Back", forState: UIControlState.Normal)
        backButton.addTarget(self, action: #selector(HowToPlayViewController.back) , forControlEvents: UIControlEvents.TouchUpInside)
        
        //scrollView.addSubview(imageView)
        
       
        
        var instructionLabel = UILabel(frame: CGRect(x: 20, y: 70, width: view.bounds.width-40, height: scrollView.contentSize.height-50))
        instructionLabel.textColor = UIColor.whiteColor()
        instructionLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        instructionLabel.numberOfLines=0
        instructionLabel.text = "Welcome to Black Hole. In this game, there are 2 players, each of whom places 10 numbers on the board. Red goes first, placing a 1, then Blue, also placing a 1, and then Red placing a 2, Blue placing a 2, Red placing a 3 and so on until each player has placed numbers 1-10 on the board. At this point, there will be one space left on the board, which will become the Black Hole. All numbers next to the Black Hole will be \"sucked\" into it, and which ever color who's sum of numbers around the Black Hole is the least wins the game. Thank you for downloading, and be sure to play with your friends!"
        instructionLabel.sizeToFit()
        
        if(instructionLabel.bounds.height+70 < view.bounds.height){
            scrollView.contentSize = CGSize(width: view.bounds.width,height: view.bounds.height+1)
        }
        else{
            scrollView.contentSize = CGSize(width: view.bounds.width,height: instructionLabel.bounds.height+70)
        }
        var top = UIView(frame: CGRect(x: 0, y: -200, width: scrollView.bounds.size.width, height: 200))
        var bottom = UIView(frame: CGRect(x: 0, y: scrollView.contentSize.height, width: scrollView.bounds.size.width, height: 200))
        
        top.backgroundColor = UIColor.darkGrayColor()
        bottom.backgroundColor = UIColor.darkGrayColor()
        scrollView.addSubview(top)
        scrollView.addSubview(bottom)
        scrollView.addSubview(backButton)
        scrollView.addSubview(instructionLabel)
        view.addSubview(scrollView)
        // Do any additional setup after loading the view.
    }
    
    func back(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("menu")
        vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(vc, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
