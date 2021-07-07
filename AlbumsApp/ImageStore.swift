//
//  ImageStore.swift
//  AlbumsApp
//

import Foundation
import UIKit
import SwiftUI

class ImageStore {
    static func load(strUrl: String) -> Image {
        guard let url = URL(string: strUrl) else {
            print("Invalid URL:\(strUrl)")
            return Image(systemName: "wifi")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load from \(strUrl)")
            return Image(systemName: "wifi.slash")
        }
        
        guard let uiImage = UIImage(data: data) else {
            print("Not an image data: \(strUrl)")
            return Image(systemName: "wifi")
        }
        
        print("Image loaded: \(strUrl)")
        return Image(uiImage: uiImage)
    }
}
