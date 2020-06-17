//
//  PageCell.swift
//  AutoLayout
//
//  Created by Yash Patel on 2020-06-05.
//  Copyright © 2020 Darshan Patel. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell{
    
    var page : Page? {
        didSet{
//            print(page?.imageName)
            guard let unwrappedPage = page else {
                return
            }
            reachingViewsImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)" ,  attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13) , NSAttributedString.Key.foregroundColor : UIColor.gray ]))
            

            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
        }
    }
    
    private let reachingViewsImageView : UIImageView = {
           let imageView = UIImageView(image:#imageLiteral(resourceName: "2"))
           //this enables autolayot for our imageView
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.contentMode = .scaleAspectFit
           return imageView
       }()
    
    private let descriptionTextView : UITextView = {
            let textView = UITextView()
            
            let attributedText = NSMutableAttributedString(string: "Reach You Dreams , don't scupper it !", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\nYou will definately achieve your dream if you keep paddling your gears . Avoid the distraction and focous on your goal and you will definately achieve your dreams .", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13) , NSAttributedString.Key.foregroundColor : UIColor.gray ]))
            textView.attributedText = attributedText
    //        textView.font = UIFont.boldSystemFont(ofSize: 18)
            textView.textAlignment = .center
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.isEditable = false
            textView.isScrollEnabled = false
            return textView
        }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setLayot(){
            
            let topImageContainerView = UIView()
    //        topImageContainerView.backgroundColor = .blue
            addSubview(topImageContainerView)
    //        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
            //enable auto layout
            topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    //        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    //        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            //use leading and trailing anchor instead of left and right anchor
            
            
            //MARK: - top image constraints
            //        view.backgroundColor = .yellow
            //        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            
    //        reachingViewsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //        //        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    //        reachingViewsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    //        reachingViewsImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    //        reachingViewsImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    //
            topImageContainerView.addSubview(reachingViewsImageView)
            reachingViewsImageView.centerXAnchor.constraint(equalTo:topImageContainerView.centerXAnchor).isActive = true
            reachingViewsImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
            reachingViewsImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 1).isActive = true
            
            
            //MARK: - tag line constraints
            addSubview(descriptionTextView)
            descriptionTextView.topAnchor.constraint(equalTo:topImageContainerView.bottomAnchor).isActive = true
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor,constant: 24).isActive = true
            descriptionTextView.rightAnchor.constraint(equalTo : rightAnchor,constant: -24).isActive = true
            descriptionTextView.bottomAnchor.constraint(equalTo : bottomAnchor, constant: 0).isActive = true
            
        }
}
