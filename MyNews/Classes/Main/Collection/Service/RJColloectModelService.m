//
// Created by wjdtyp on 15/9/6.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJColloectModelService.h"
#import "RJColloectModel.h"
#import "RJColloectModelDAO.h"

@implementation RJColloectModelService

- (RJColloectModel *)findModel:(RJColloectModel *)model {
    RJColloectModelDAO *dao = [[RJColloectModelDAO alloc] init];
    return [dao findModel:model];
}

- (void)saveModel:(RJColloectModel *)model {
    RJColloectModelDAO *dao = [[RJColloectModelDAO alloc] init];
    [dao addModel:model];
}

- (void)updateModel:(RJColloectModel *)model {
    RJColloectModelDAO *dao = [[RJColloectModelDAO alloc] init];
    [dao updateModel:model];
}

- (void)findAllNotes {

}

- (void)modifyNote:(RJColloectModel *)model {

}
@end