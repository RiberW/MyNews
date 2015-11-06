//
//  RJPictureDetailView.m
//  MyNews
//
//  Created by wjdtyp on 15/9/6.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import "RJPictureDetailView.h"
#import "RJColloectModelService.h"



@implementation RJPictureDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)backBtn:(id)sender {

}
- (IBAction)likeBtn:(id)sender {
    RJColloectModelService *service= [[RJColloectModelService alloc] init];
    [service findModel:nil];
}
- (IBAction)collectBtn:(id)sender {

}
- (IBAction)shareBtn:(id)sender {


}
@end
