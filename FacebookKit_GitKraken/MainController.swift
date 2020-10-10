//
//  MainController.swift
//  FacebookKit_GitKraken
//
//  Created by Maximiliano Lopez Ortiz on 10/10/20.
//  Copyright © 2020 Maximiliano Lopez Ortiz. All rights reserved.
//

import UIKit
import LBTATools

class PostCell: LBTAListCell<String> {
    
    let imageView = UIImageView(backgroundColor: .red)
    let nameLabel = UILabel(text: "Name Label")
    let dateLabel = UILabel(text: "Friday at 11:11 AM")
    let postText = UILabel(text: "Here is some text")
//    let imageViewGrill = UIView(backgroundColor: .yellow)
    
    let photosGrillCOntroller = PhotosGrillController()
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(hstack(imageView.withHeight(40).withWidth(40),
                     stack(nameLabel, dateLabel),
                     spacing: 8).padLeft(12).padRight(12).padTop(12),
              postText,
              photosGrillCOntroller.view,
              spacing: 8)
    }
}

class MainController: LBTAListController<PostCell, String>, UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        self.items = ["hello", "WORLD", "WORLD"]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
}

import SwiftUI
struct MainPreview:  PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) ->  UIViewController {
            return MainController()
        }
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: Context) {
           
        }
    }
}
