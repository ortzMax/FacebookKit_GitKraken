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

class StoryHeader: UICollectionReusableView {
    
    let storiesController = StoriesController(layout: UICollectionViewLayout(), scrollDirection: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        stack(storiesController.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class StoryPhotoCell: LBTAListCell <String> {
    override func setupViews() {
        backgroundColor = .blue
    }
}

class StoriesController: LBTAListController<StoryPhotoCell, String> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = ["avatar1", "avatar1"]
    }
}

class MainController: LBTAListHeaderController<PostCell, String, StoryHeader>, UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        self.items = ["hello", "WORLD", "WORLD"]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 0, bottom: 0, right: 0)
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
