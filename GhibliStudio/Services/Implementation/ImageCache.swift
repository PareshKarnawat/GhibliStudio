//
//  ImageCache.swift
//  GhibliStudio
//
//  Created by Paresh Karnawat on 07/07/25.
//
import Foundation
import UIKit

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}

func loadImage(from url: URL) async -> UIImage? {
    if let cached = ImageCache.shared.object(forKey: url.absoluteString as NSString) {
        return cached
    }
    
    do {
        let(data, _) = try await URLSession.shared.data(from: url)
        if let image = UIImage(data: data) {
            ImageCache.shared.setObject(image, forKey: url.absoluteString as NSString)
            return image
        }
    } catch {
        print("Error while downloading image \(error.localizedDescription)")
    }
    return nil
}


