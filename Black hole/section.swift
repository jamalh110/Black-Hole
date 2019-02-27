//
//  section.swift
//  Black hole
//
//  Created by guest  on 5/31/16.
//  Copyright © 2016 lithium llamas. All rights reserved.
//

import UIKit

class section: NSObject {
    var parent:BlackHoleController?
    var view = sectionView()
    var color = 0
    var number = 0
    var label = UILabel()
    var circle = UIImageView(image: UIImage(named: "circle"))
    var row = 0
    var column = 0
    var occupied = false;
    init(size:CGFloat, row:Int, column:Int, x:CGFloat,y:CGFloat) {
        
        let sizeRect = CGRect(x: x, y: y, width: size, height: size)
        view.frame = sizeRect
        //label.text = String(row)+","+String(column)
        label.text = "-"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Arial", size: 15)
        
        self.row = row
        self.column = column
        super.init()
        label.frame = CGRect(x: 0,y: 0,width: size,height: size)
        label.center = CGPoint(x: size/2,y: size/2)
        label.textAlignment = NSTextAlignment.Center
        print(label.frame.size.height)
        print(label.frame.midX)
        view.addSubview(label)
        circle.image?.drawInRect(CGRect(x: 0, y: 0, width: size, height: size))
        circle.frame = CGRect(x: 0, y: 0, width: size, height: size)
        view.addSubview(circle)
        
        let recognizer = UITapGestureRecognizer(target: self.view, action: #selector(section.onTap))
        recognizer.numberOfTapsRequired = 1
        view.userInteractionEnabled = true
        

        
        self.view.addGestureRecognizer(recognizer)
        view.parent = self

        
        
    }
    func fill(number:Int,color:Int){
        self.number = number
        self.color = color
        self.occupied = true
        self.label.text = String(number)
        if(color==0){
        self.label.textColor = UIColor.redColor()
        }
        if(color==1){
            self.label.textColor = UIColor(colorLiteralRed: 0.2, green: 1, blue: 1, alpha: 1)

        }
    }
    func reset(){
        self.number = 0
        self.color = 0
        self.occupied = false
        self.label.text = "-"
        label.textColor=UIColor.whiteColor()
    }
    func onTap(){
        parent?.onTap(self)
    }
    
    
    func getAdjacent() -> [[Int]]{
        var spaces = [[Int]]()
        if(row>0){
            if(column-1>=0){
                spaces.append([row-1,column-1])
            }
            if(column<row-1+1){
                spaces.append([row-1,column])
            }
            
        }
        if(column-1>=0){
            spaces.append([row, column-1])
        }
        if(column+1<=row){
            spaces.append([row, column+1])
        }
        if(row<5){
            spaces.append([row+1,column])
            spaces.append([row+1,column+1])
        }
        return spaces
    }
    
    func setup(number:Int, color:Int){
        occupied = true
    }
}
