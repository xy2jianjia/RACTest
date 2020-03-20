//
//  HomeCollectionViewController.m
//  RACTest
//
//  Created by monan on 2020/3/19.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "HomeCollectionViewController.h"

#import "Logic.h"
#import "InfoCell.h"
#import "HomeLayout.h"
@interface HomeCollectionViewController ()

@property (nonatomic,strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *infocell;

@end

@implementation HomeCollectionViewController

static NSString * const reuseIdentifier = @"InfoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    Logic *logic = [[Logic alloc] init];
    [logic getHome];
    @weakify(self);
    [logic.httpCMD.executionSignals subscribeNext:^(RACSignal* signal) {
        [[signal dematerialize] subscribeNext:^(NSData *data) {
//            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *info = [data objectFromJSONData];
            NSArray *arr = [info objectForKey:@"images"];
            @strongify(self);
            
            self.dataSource = [[arr valueForKey:@"url"] mutableCopy];
//            [self.collectionView reloadData];
            
        } error:^(NSError * _Nullable error) {
            
        }];

    } error:^(NSError * _Nullable error) {

    }];
    [logic.httpCMD execute:nil];
    [RACObserve(self, dataSource) subscribeNext:^(id x) {
       @strongify(self);
       
       [self.collectionView reloadData];
    }];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InfoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *url = [_dataSource objectAtIndex:indexPath.item];
    cell.url = url;
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSString *url = [_dataSource objectAtIndex:indexPath.item];
    UIViewController *goodsDetailVC = [[CTMediator sharedInstance] getDetailActionWithURL:url];
    if (goodsDetailVC) {
        goodsDetailVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:goodsDetailVC animated:YES];
    }
}
#pragma mark <UICollectionViewDelegate>
//
////定义每个Item 的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    float width = (SCREEN_WIDTH - k_width(20)) / 2;
//    float height = width / 1.1764;
//    
//    return  CGSizeMake(width,height);  //设置cell宽高
//    
//}
//
////定义每个UICollectionView 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    float top = k_width(20);
//    float left = k_height(5);
//    
//    return UIEdgeInsetsMake(top,left, top , left);
//    
//    
//}
//
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
////    float scaleh = SCREEN_HEIGHT / 667;
//    return k_height(5);
//    //    }
//    
//}
//
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    
//    return k_width(5);
//}

@end
