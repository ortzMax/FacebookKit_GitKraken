//
//  PhotosGrillController.swift
//  FacebookKit_GitKraken
//
//  Created by Maximiliano Lopez Ortiz on 10/10/20.
//  Copyright © 2020 Maximiliano Lopez Ortiz. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

class PhotoGrillCell: LBTAListCell <String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    let imageView = UIImageView(image: UIImage(named: "avatar1"), contentMode: .scaleAspectFill)
    
    override func setupViews() {
        backgroundColor = .yellow
        stack(imageView)
    }
}

class PhotosGrillController: LBTAListController<PhotoGrillCell, String>, UICollectionViewDelegateFlowLayout {
    
    let cellSpacing: CGFloat = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        
        self.items = ["avatar1","story_photo1","story_photo2","avatar1","avatar1"]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.items.count == 4 {
            //do 4 grill cell layout
        }
        
        if indexPath.item == 0 || indexPath.item == 1 {
            let width = (view.frame.width - 3 * cellSpacing) / 2
            return.init(width: width, height: width)
        }
        let width = (view.frame.width - 4.1 * cellSpacing) / 3
        
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}

import SwiftUI
struct PhotoGrillPreview:  PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) ->  UIViewController {
            return PhotosGrillController()
        }
        func updateUIViewController(_ uiViewController: PhotoGrillPreview.ContainerView.UIViewControllerType, context: Context) {
           
        }
    }
}
