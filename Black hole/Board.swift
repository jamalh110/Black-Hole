//
//  Board.swift
//  Black hole
//
//  Created by guest  on 5/31/16.
//  Copyright © 2016 lithium llamas. All rights reserved.
//

import UIKit

class Board: NSObject {
    var board = [[section]](count: 6, repeatedValue: [section](count: 0, repeatedValue: section(size: 0, row: 0, column: 0, x: 0, y: 0)))
    init(height:CGFloat,width:CGFloat) {
        board[0] = [section(size: height/6, row: 0, column: 0, x: width/2-height/12, y: 0)]
        board[1] = [section(size: height/6, row: 1, column: 0, x: width/2-height/12*2, y: height*1/6),section(size: height/6, row: 1, column: 1, x: width/2, y: height*1/6)]
        board[2] = [section(size: height/6, row: 2, column: 0, x: width/2-height/12*3, y: height*2/6),section(size: height/6, row: 2, column: 1, x: width/2-height/12*1, y: height*2/6),section(size: height/6, row: 2, column: 2, x: width/2-height/12 * -1, y: height*2/6)]
        board[3] = [section(size: height/6, row: 3, column: 0, x: width/2-height/12 * 4, y: height*3/6),section(size: height/6, row: 3, column: 1, x: width/2-height/12 * 2, y: height*3/6),section(size: height/6, row: 3, column: 2, x: width/2, y: height*3/6),section(size: height/6, row: 3, column: 3, x: width/2-height/12 * -2, y: height*3/6)]
        board[4] = [section(size: height/6, row: 4, column: 0, x: width/2-height/12 * 5, y: height*4/6),section(size: height/6, row: 4, column: 1, x: width/2-height/12 * 3, y: height*4/6),section(size: height/6, row: 4, column: 2, x: width/2-height/12 * 1, y: height*4/6),section(size: height/6, row: 4, column: 3, x: width/2-height/12 * -1, y: height*4/6),section(size: height/6, row: 4, column: 4, x: width/2-height/12 * -3, y: height*4/6)]
        
        board[5] = [section(size: height/6, row: 5, column: 0, x: width/2-height/12 * 6, y: height*5/6),section(size: height/6, row: 5, column: 1, x: width/2-height/12 * 4, y: height*5/6),section(size: height/6, row: 5, column: 2, x: width/2-height/12 * 2, y: height*5/6),section(size: height/6, row: 5, column: 3, x: width/2, y: height*5/6),section(size: height/6, row: 5, column: 4, x: width/2-height/12 * -2, y: height*5/6),section(size: height/6, row: 5, column: 5, x: width/2-height/12 * -4, y: height*5/6)]
        
    }
    func drawBoard(view:UIView){
        for index in 0...5{
            for index2 in 0...(board[index].count-1){
                view.addSubview(board[index][index2].view)
            }
        }
    }
    
    func getFree() -> [section]{
        var freeSections = [section]()
        for i in board{
            for j in i{
                //j.view.removeFromSuperview()
                if(j.occupied == false){
                    freeSections.append(j)
                }
            }
        }
        return freeSections
    }
    
    func reset(){
        for i in board{
            for j in i{
                //j.view.removeFromSuperview()
                j.reset()
                
            }
        }
        
    }
    
    
}
