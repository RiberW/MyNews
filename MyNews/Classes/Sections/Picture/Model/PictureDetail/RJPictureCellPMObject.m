//
// Created by wjdtyp on 15/8/7.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJPictureCellPMObject.h"
#import "RJPictureCellPMData.h"
#import "RJPictureCellPMObjectData.h"


@implementation RJPictureCellPMObject {

}

+ (NSDictionary *)objectClassInArray
{
    return @{@"data" : [RJPictureCellPMObjectData class]};
}

@end