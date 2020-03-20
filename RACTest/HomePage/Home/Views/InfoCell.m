//
//  InfoCell.m
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "InfoCell.h"

@interface InfoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation InfoCell

-(void)setUrl:(NSString *)url {
    url = [@"https://www.bing.com" stringByAppendingString:url];
    [_imageV sd_setImageWithURL:[NSURL URLWithString:url]];
}
-(void)awakeFromNib {
    [super awakeFromNib];
    
}
@end
