//
//  HKAlamofireImageView.swift
//  Genemedics
//
//  Created by Plenar on 29/09/16.
//  Copyright © 2016 Plenar. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
open class HKAlamofireImageView: UIImageView {
    
    private var recipt:RequestReceipt?
    static var downloader = ImageDownloader(
        configuration: ImageDownloader.defaultURLSessionConfiguration(),
        downloadPrioritization: .lifo,
        maximumActiveDownloads: 4,
        imageCache: AutoPurgingImageCache()
    )
    
    public func cancelRequest(){
        guard let request = recipt else {
            return
        }
        HKAlamofireImageView.downloader.cancelRequest(with: request)
        
    }
    
    public func downloadImage(url:URL?,placeHolder:UIImage,imageType:HKAlamofireImageType = .normal) {
        self.image = placeHolder
        guard let url = url else {
            return
        }
        
        self.recipt = HKAlamofireImageView.downloader.download(URLRequest(url:url), completion: { (response) in
            
            
            if let image = response.result.value {
                
                if imageType == .rounded {
                    self.image = image.af_imageRoundedIntoCircle()
                }else{
                    self.image = image.af_imageAspectScaled(toFit: self.frame.size)
                }
                
                
            }
            
            
        })
        
    }
    
    
    
    
    
}

public enum HKAlamofireImageType{
    
    case rounded
    case normal
}
