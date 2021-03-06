//
//  Utility.swift
//  MobileERP
//
//  Created by Yangzheng on 15/3/30.
//  Copyright (c) 2015年 Yangzheng. All rights reserved.
//

import Foundation
import UIKit

enum UIUserInterfaceIdiom : Int
{
    case unspecified
    case phone
    case pad
}

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

struct OSVersion
{
    static let IS_IOS_7 = NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1
    static let IS_IOS_8 = NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1
}

class Utility {
    
}
