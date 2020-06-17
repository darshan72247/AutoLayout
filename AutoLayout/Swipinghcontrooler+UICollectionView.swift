//
//  Swipinghcontrooler+UICollectionView.swift
//  AutoLayout
//
//  Created by Yash Patel on 2020-06-06.
//  Copyright © 2020 Darshan Patel. All rights reserved.
//

import UIKit

extension SwipingController{
 
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return pages.count
        }
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
            
            let page = pages[indexPath.row]
            cell.page = page
    //        cell.backgroundColor = indexPath.row % 2 == 0 ? .red : .green
              
    //        cell.reachingViewsImageView.image = UIImage(named: pages[indexPath.item].imageName)
    //        cell.descriptionTextView.text = pages[indexPath.item].headerText
    //        cell.descriptionTextView.font = UIFont.boldSystemFont(ofSize: 18)

            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.height)
        } 
}
