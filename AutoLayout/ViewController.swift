//
//  ViewController.swift
//  AutoLayout
//
//  Created by Yash Patel on 2020-06-05.
//  Copyright © 2020 Darshan Patel. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/655, alpha: 1)
}

class ViewController: UIViewController {
    
    //lets avoid polluting viewDidload
    let reachingViewsImageView : UIImageView = {
        let imageView = UIImageView(image:#imageLiteral(resourceName: "2"))
        //this enables autolayot for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView : UITextView = {
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
    
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton : UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("NEXT", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
           return button
       }()
    
    private let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = UIColor(displayP3Red: 249/225, green: 207/225, blue: 224/225, alpha: 1)
        pc.currentPageIndicatorTintColor = .mainPink
        
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.addSubview(reachingViewsImageView)
        view.addSubview(descriptionTextView)
        setLayot()
        setUpBottomControls()
    }
    
    fileprivate func setUpBottomControls(){
//        view.addSubview(previousButton)
        previousButton.backgroundColor = .none
//        previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor) ,
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setLayot(){
        
        let topImageContainerView = UIView()
//        topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
//        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        //enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
        
        descriptionTextView.topAnchor.constraint(equalTo:topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    

    
}

