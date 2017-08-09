//
//  StickyFlowLayout.swift
//  Pods
//
//  Created by Ryan Wang on 09/08/2017.
//
//

import UIKit

open class StickyFlowLayout: UICollectionViewFlowLayout {
    open var stickyItemCount = 2
    
    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        if layoutAttributes == nil || layoutAttributes!.count == 0 {
            return layoutAttributes
        }
        
        
        var newAttributesArray = [UICollectionViewLayoutAttributes]()
        for (_, value) in layoutAttributes!.enumerated() {
            if value.indexPath.item < stickyItemCount {
                let newLayoutAttributes = value.copy() as! UICollectionViewLayoutAttributes
                var frame = newLayoutAttributes.frame
                if self.collectionView!.contentOffset.x > 0 {
                    frame.origin.x = 0 //;;-= self.collectionView!.contentOffset.x
                }
                
                newLayoutAttributes.zIndex = 1000
                newLayoutAttributes.frame = frame
                newAttributesArray.append(newLayoutAttributes)
            } else {
                newAttributesArray.append(value)
            }
            
        }
        
        return newAttributesArray
//        [allItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//            UICollectionViewLayoutAttributes *attributes = obj;
//            
//            CGRect frame = attributes.frame;
//            frame.origin.y += self.parallaxHeaderReferenceSize.height;
//            attributes.frame = frame;
//            
//            NSIndexPath *indexPath = [(UICollectionViewLayoutAttributes *)obj indexPath];
//            BOOL isHeader = [[obj representedElementKind] isEqualToString:UICollectionElementKindSectionHeader];
//            BOOL isFooter = [[obj representedElementKind] isEqualToString:UICollectionElementKindSectionFooter];
//            
//            if (isHeader) {
//            [headers setObject:obj forKey:@(indexPath.section)];
//            } else if (isFooter) {
//            // Not implemeneted
//            } else {
//            UICollectionViewLayoutAttributes *currentAttribute = [lastCells objectForKey:@(indexPath.section)];
//            
//            // Get the bottom most cell of that section
//            if ( ! currentAttribute || indexPath.row > currentAttribute.indexPath.row) {
//            [lastCells setObject:obj forKey:@(indexPath.section)];
//            }
//            
//            if ([indexPath item] == 0 && [indexPath section] == 0) {
//            visibleParallexHeader = YES;
//            }
//            }

        
        
        
    }
    
    open override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let layoutAttributes = super.layoutAttributesForItem(at: indexPath) {
            if indexPath.item < stickyItemCount && self.collectionView != nil {
                let newLayoutAttributes = layoutAttributes.copy() as! UICollectionViewLayoutAttributes
                var frame = newLayoutAttributes.frame
                if self.collectionView!.contentOffset.x > 0 {
                    frame.origin.x -= self.collectionView!.contentOffset.x
                }
                newLayoutAttributes.frame = frame
                
                return newLayoutAttributes
            }
            
            return layoutAttributes
        }
        return nil
    }
    
    open override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

//    static func layoutAttributesClass() -> AnyClass {
//        return StickyFlowLayout.self
//    }
    
//    + (Class)layoutAttributesClass {
//    return [CSStickyHeaderFlowLayoutAttributes class];
//    }


}
