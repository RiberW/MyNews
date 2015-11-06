//
//  RJPictureDetailController.h
//  News
//
//  Created by wjdtyp on 15/8/1.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJNewsNewsListObject.h"

@class RJPictureDetailView;
@class RJPictureCellData;
@class RJColloectModelService;

@interface RJPictureDetailController : UIViewController
@property(nonatomic, strong)RJNewsNewsListObject *pictureModel;
@property(nonatomic, strong)RJPictureDetailView *detailView;
@property(nonatomic, strong)RJPictureCellData *data;
@property (nonatomic,strong) RJColloectModelService *collectModel;
@end
