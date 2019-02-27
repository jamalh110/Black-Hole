//
//  sectionView.swift
//  Black hole
//
//  Created by guest  on 6/25/16.
//  Copyright © 2016 lithium llamas. All rights reserved.
//

import UIKit

class sectionView: UIView {
    var parent:section?
    override init(frame: CGRect) {
        //parent = section(size: 0, row: 0, column: 0, x: 0, y: 0)

        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //parent = section(size: 0, row: 0, column: 0, x: 0, y: 0)

        super.init(coder: aDecoder)
        didLoad()
       // parent = section(size: 0, row: 0, column: 0, x: 0, y: 0)

    }
    
    convenience init() {
        self.init(frame: CGRectZero)
        //parent = section(size: 0, row: 0, column: 0, x: 0, y: 0)

    }
    func didLoad() {
        //Place your initialization code here
        
        //I actually create & place constraints in here, instead of in
        //updateConstraints
    }
    /*func onTap(parent: section){
        print(String(parent.row)+","+String(parent.column))
        print("hi")
    }*/
    func onTap(){
        //print(String(parent!.row)+","+String(parent!.column))
        //print("hi")
        parent?.onTap()
    }
}
