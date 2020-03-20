//
//  HomeLayout.m
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "HomeLayout.h"

@implementation HomeLayout

-(void)prepareLayout {
    [super prepareLayout];
    // 水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    float width = (SCREEN_WIDTH - 30) / 2;
    self.itemSize = CGSizeMake(width, 160);
    // 决定第一张图片所在的位置
    CGFloat margin = (self.collectionView.frame.size.width - self.itemSize.width) / 2;
    float top = 10;
    float left = 10;
    float bottom = 5;
    float right = 10;
    self.collectionView.contentInset = UIEdgeInsetsMake(top, left, bottom, right);
}

//-(CGSize)collectionViewContentSize {
//    CGFloat height = ceil([[self collectionView] numberOfItemsInSection:0] / 5) * SCREEN_WIDTH / 2;
//    return  CGSizeMake(SCREEN_WIDTH, height);
//}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
//-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 闪屏现象解决参考 ：https://blog.csdn.net/u013282507/article/details/53103816
    //扩大控制范围，防止出现闪屏现象
    rect.size.width = rect.size.width + SCREEN_WIDTH;
    rect.origin.x = rect.origin.x - SCREEN_WIDTH/2;
 
    // 让父类布局好样式
    NSArray *arr = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    
    
    for (UICollectionViewLayoutAttributes *attributes in arr) {
        CGFloat scale;
//        scale = 1.0;
        
        // collectionView 的 centerX
        CGFloat centerX = self.collectionView.center.x;
        CGFloat step = ABS(centerX - (attributes.center.x - self.collectionView.contentOffset.x));
//        NSLog(@"step %@ : attX %@ - offset %@", @(step), @(attributes.center.x), @(self.collectionView.contentOffset.x));
        scale = fabsf(cosf(step/centerX * M_PI/5));
        
        attributes.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return arr;
}
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    // 保证滚动结束后视图的显示效果
    
    // 计算出最终显示的矩形框
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
 
    // 获得 super 已经计算好的布局的属性
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
 
    // 计算 collectionView 最中心点的 x 值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
 
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in arr) {
        if (ABS(minDelta) > ABS(attrs.center.x - centerX)) {
            minDelta = attrs.center.x - centerX;
        }
    }
 
    proposedContentOffset.x += minDelta;
    
    return proposedContentOffset;
} //
@end
