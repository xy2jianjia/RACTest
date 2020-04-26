//
//  QLIAPViewController.m
//  RACTest
//
//  Created by monan on 2020/4/26.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "QLIAPViewController.h"
#import "NSObject+visibleViewController.h"
#import "QMIAPLogic.h"
@interface QLIAPViewController ()

@end

@implementation QLIAPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)goIAP:(UIButton *)sender {
    K_WeakSelf;
    
    [SVProgressHUD showWithStatus:@"正在购买"];
//    [SVProgressHUD show];
    [QMIAPLogic goPay:@"com.xiangqin.marry.qm.001" completed:^(BOOL flag ,NSString *msg ,NSDictionary *body) {

        NSInteger code = [[body objectForKey:@"code"] integerValue];

        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            if (flag && code == 200) {
                [weakSelf showAlert:@"购买成功！"];
//                [[NSNotificationCenter defaultCenter] postNotificationName:Refresh_Userprofile_Notification object:nil];
            }else{
                NSString *errorMsg = [@"购买失败！-- " stringByAppendingFormat:@"%@",msg];
                [weakSelf showAlert:errorMsg];
            }
        });
    }];
}
- (void) showAlert :(NSString *)errorMsg{
    
    NSString *msg = errorMsg;
    NSString *title = @"提示";
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"知道了" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:action3];
    
    [self presentViewController:vc animated:YES completion:nil];
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
