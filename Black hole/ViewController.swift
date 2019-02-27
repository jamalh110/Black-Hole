//
//  ViewController.swift
//  Black hole
//
//  Created by guest  on 5/31/16.
//  Copyright © 2016 lithium llamas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BlackHoleController {
    var tapNumber = 0
    //var board = [section](count: 6, repeatedValue: section(size: 10, row: 0, column: 0, x: 0, y: 0))
    var height:CGFloat = 0
    var width:CGFloat = 0
    var button = UIButton()
    var menu = UIButton()
    var board:Board?
    var label = UILabel()
    var nextMove = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        height = self.view.frame.height
        width = self.view.frame.width
        //title.text = "Reset"
        //button = UIButton(frame: CGRectMake(15, 15, button.frame.width, button.frame.height))
        button = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(15, 15, 50, 90)
        //button.center = CGPoint(
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("Reset", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
       // button.targetForAction(#selector(ViewController.reset), withSender: self)
        button.addTarget(self, action: #selector(ViewController.reset), forControlEvents: UIControlEvents.TouchUpInside)
        //button.frame = CGRect(x: 15, y: 15, width: button.frame.width, height: button.frame.height)
        self.view.addSubview(button)
        
        menu = UIButton(type: UIButtonType.System)
        menu.frame = CGRectMake(15, 15, 50, 20)
        //button.center = CGPoint(
        menu.backgroundColor = UIColor.clearColor()
        menu.setTitle("Menu", forState: UIControlState.Normal)
        menu.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        // button.targetForAction(#selector(ViewController.reset), withSender: self)
        menu.addTarget(self, action: #selector(ViewController.menuClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(menu)
        //button.frame = CGRect(x: 15, y:
        
        label.frame = CGRectMake(width-150, 15, 135, 20)
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
        nextMove.frame = CGRectMake(width-150, 35, 135, 100)
        nextMove.textColor = UIColor.whiteColor()
        nextMove.lineBreakMode = NSLineBreakMode.ByWordWrapping
        nextMove.numberOfLines = 0
        nextMove.text = "Red's turn to place 1"
        self.view.addSubview(nextMove)

        print(height)
       /* for index in 0...5 {
            board[index] = section(size: height/6, row: 0, column: index, x: width/2-height/12, y: CGFloat(index)/6*height)
            print(board[index].view.frame.height)
            
            self.view.addSubview(board[index].view)
            
        }*/
        board = Board(height: height, width: width)
        board!.drawBoard(self.view)
        
        let adjacent = board!.board[3][0].getAdjacent()
        for i in adjacent{
           // print(String(i[0])+","+String(i[1]))
        }
        for i in board!.board{
            for j in i{
                j.parent=self
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    func menuClick(){
        //presentViewController(UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("menu"), animated: true, completion: nil)
        //self.showDetailViewController(UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("menu"), sender: self)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("menu")
        vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    func onTap(sec:section){
        if(tapNumber>20){
            return
        }

        if(sec.occupied==false){
            sec.fill(tapNumber/2 + 1, color: tapNumber%2)
            tapNumber++
            if (tapNumber%2==1){
                nextMove.text = "Blue's turn to place "+String(tapNumber/2 + 1)
            }
            else{
                nextMove.text = "Red's turn to place "+String(tapNumber/2 + 1)

            }
        }
        if(tapNumber==20){
            tapNumber++
            print("game over")
            nextMove.text = "Game Over"

            for i in (board?.board)!{
                for j in i{
                    if(j.occupied==false){
                        var total0=0
                        var total1=0
                        for y in j.getAdjacent(){
                            if(board!.board[y[0]][y[1]].color==0){
                                total0+=board!.board[y[0]][y[1]].number
                            }
                            else{
                                total1+=board!.board[y[0]][y[1]].number
                            }
                        }
                        if(total0>total1){
                            label.text="Blue Wins!"
                        }
                        if(total1>total0){
                            label.text = "Red Wins!"
                        }
                        if(total0==total1){
                            label.text = "Tie!"
                        }
                        print("redtotal: "+String(total0)+"    BlueTotal: "+String(total1))
                    }
                }
            }
        }
        
    }
    func reset(){
        board?.reset()
        tapNumber=0
        label.text=""
        nextMove.text = "Red's turn to place 1"

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

