//
//  ViewController.swift
//  CollectionDemo
//
//  Created by Yangzheng on 15/6/19.
//  Copyright (c) 2015年 Yangzheng. All rights reserved.
//

import UIKit

let reuseIdentifier = "CollectionCell"

let cars = ["丰田", "雷克萨斯", "本田", "奥迪", "奔驰", "宝马", "英菲尼迪", "丰田", "雷克萨斯", "本田", "奥迪", "奔驰", "宝马", "英菲尼迪"]
let colors = [UIColor.purple, UIColor.red, UIColor.blue, UIColor.orange, UIColor.green]

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
    func initCollectionView(_ collectionView: UICollectionView) {
        let screenWidth = UIScreen.main.bounds.size.width
        self.collectionView.frame.size.width = screenWidth
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
        
        //var thisCell = cell as! CollectionCell
        cell.CellButton.setTitle(cars[indexPath.item], for: UIControlState())//
        
        print(cell.frame.width)
        //println(self.collectionView.frame.width)
        // Configure the cell
        cell.backgroundColor = colors[indexPath.item % 5]
        
        return cell
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // 6p的像素密度较大，因此分割线间隔调高为1
        if DeviceType.IS_IPHONE_6P {
            return CGFloat(1)
        }
        else {
            return CGFloat(0.5)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
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

