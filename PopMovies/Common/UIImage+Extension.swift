//
//  UIImage+Extension.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import Foundation
import UIKit

extension UIImage {
    class func getImageFromURL(imageString: String) -> UIImage? {
        if let urlImage = URL(string: imageString) {
            let data = try? Data(contentsOf: urlImage)
            if let imageData = data {
                return UIImage(data: imageData) ?? UIImage()
            }
        }
        return nil
    }
}
