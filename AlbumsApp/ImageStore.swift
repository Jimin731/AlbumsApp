//
//  ImageStore.swift
//  AlbumsApp
//

import Foundation
import UIKit
import SwiftUI

class ImageStore {
    static func load(strUrl: String, onDownload: @escaping (Image) -> Void) -> Image {
        guard let url = URL(string: strUrl) else {
            print("Invalid URL:\(strUrl)")
            return Image(systemName: "tv.music.note")
        }
        NSLog("start: \(strUrl)")
        OperationQueue().addOperation {
            guard let data = try? Data(contentsOf: url) else {
                print("Failed to load from \(strUrl)")
                return
            }
            guard let uiImage = UIImage(data: data) else {
                print("Not an image data: \(strUrl)")
                return
            }
            let image = Image(uiImage: uiImage)
            NSLog("end: \(strUrl)")
            onDownload(image)
        }
        
//        guard let data = try? Data(contentsOf: url) else {
//            print("Failed to load from \(strUrl)")
//            return Image(systemName: "tv.music.note")
//        }
//
//        guard let uiImage = UIImage(data: data) else {
//            print("Not an image data: \(strUrl)")
//            return Image(systemName: "tv.music.note")
//        }
        
        
//
//        print("Image loaded: \(strUrl)")
//        return Image(uiImage: UIImage)
        return Image(systemName: "tv.music.note")
    }
}
