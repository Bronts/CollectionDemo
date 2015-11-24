//
//  ViewController.swift
//  CollectionDemo
//
//  Created by Yangzheng on 15/6/19.
//  Copyright (c) 2015年 Yangzheng. All rights reserved.
//

import UIKit

let reuseIdentifier = "CollectionCell"

let cars = ["丰田", "雷克萨斯", "本田", "奥迪", "奔驰", "宝马", "英菲尼迪"]
let colors = [UIColor.purpleColor(), UIColor.redColor(), UIColor.blueColor(), UIColor.orangeColor()]

class ViewController: UIViewController {
    // 定义SB中的collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initCollectionView(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - 扩展实现UICollectionView
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    /*******************************************************************************
    *  Description: 初始化collectoonView的宽度
    *
    *  param: collectionView collectionView实例
    *
    *  returns: none
    *  ---------------------------------------------------------------------------
    *                Date          Author             Operation
    *             2015-07-07     Yangzheng         Create Function
    ********************************************************************************/
    func initCollectionView(collectionView: UICollectionView) {
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        self.collectionView.frame.size.width = screenWidth
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionCell
        
        //var thisCell = cell as! CollectionCell
        cell.CellButton.setTitle(cars[indexPath.item], forState: UIControlState.Normal)//
        
        print(cell.frame.width)
        //println(self.collectionView.frame.width)
        // Configure the cell
        cell.backgroundColor = colors[indexPath.item % 4]
        
        return cell
    }
    

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var itemSize = CGSize()
        
        if DeviceType.IS_IPHONE_5 {
            if (indexPath.item % 4) == 3 {
                itemSize = CGSize(width: 80, height: 100)
            }
            else {
                itemSize = CGSize(width: 79.5, height: 100)
            }
        }
        else if DeviceType.IS_IPHONE_6 {
            if (indexPath.item % 4) == 3 {
                itemSize = CGSize(width: 93, height: 100)
            }
            else {
                itemSize = CGSize(width: 93.5, height: 100)
            }
        }
        else if DeviceType.IS_IPHONE_6P {
            itemSize = CGSize(width: 82, height: 100)
        }
        
        return itemSize
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        // 6p的像素密度较大，因此分割线间隔调高为1
        if DeviceType.IS_IPHONE_6P {
            return CGFloat(1)
        }
        else {
            return CGFloat(0.5)
        }
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        if DeviceType.IS_IPHONE_6P {
            return CGFloat(1)
        }
        else {
            return CGFloat(0.5)
        }
    }
}

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var CellButton: UIButton!
}

