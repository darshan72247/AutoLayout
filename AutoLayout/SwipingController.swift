//
//  SwipingController.swift
//  AutoLayout
//
//  Created by Yash Patel on 2020-06-05.
//  Copyright © 2020 Darshan Patel. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    
    let pages = [Page(imageName: "1", headerText: "Stay Real EState", bodyText: "My bussiness my own bussiness none of your bussiness. Enjoy your life and mine your own bussiness !"),
                 Page(imageName: "2", headerText: "Reach You Dreams , don't scupper it !", bodyText: "You will definately achieve your dream if you keep paddling your gears . Avoid the distraction and focous on your goal and you will definately achieve your dreams ."),
                 Page(imageName: "3", headerText: "N A S A", bodyText: "Think out of box . Be different and stay different. Don't stay on Earth rather stay on ISS !"),
                 Page(imageName: "4", headerText: "Lunica be more Powerfully ", bodyText: "The world most powerefull programming language ever made , know one programming language and roar the other !")
    ]
    
    
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePrev(){
        let prevIndex = max(pageControl.currentPage - 1,0)
        let indexPateh = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView.scrollToItem(at: indexPateh, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton : UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("NEXT", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
           return button
       }()
    
    @objc func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1,pages.count-1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true )
    }
    
     lazy var pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = UIColor(displayP3Red: 249/225, green: 207/225, blue: 224/225, alpha: 1)
        pc.currentPageIndicatorTintColor = .mainPink
        
        return pc
    }()
    
//    let imagesNames = ["1","2","3","4"]
//    let headerString = ["Stay Real EState","Reach You Dreams , don't scupper it !","NASA","Lunica be more Powerfully "]
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
//        print(x,view.frame.width,x/view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
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

    
}
