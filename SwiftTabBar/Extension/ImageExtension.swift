//
//  ImageExtension.swift
//  SwiftTabBar
//
//  Created by Jose Preatorian on 05-04-18.
//  Copyright © 2018 Jose Preatorian. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } else {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "notphoto")
                }
            }
        }
    }
}

