//
//  DetailViewController.m
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _url = [@"https://www.bing.com" stringByAppendingString:_url];
    [_imageV sd_setImageWithURL:[NSURL URLWithString:_url]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
