//
//  ImageConvertible.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/23.
//
//

import UIKit

public protocol ImageConvertible {
    associatedtype Image
    var convertedImage: Image { get }
}

@available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
extension UIColor: ImageConvertible {

    /// Returns a UIImage based on a graphics context with filling UIColor.
    public var convertedImage: UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext? = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
