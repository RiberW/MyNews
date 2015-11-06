//
// Created by wjdtyp on 15/8/7.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJPictureCellPM.h"
#import "RJPictureCellPMData.h"
#import "RJPictureCellPMObject.h"


@implementation RJPictureCellPM {

}
+ (NSDictionary *)objectClassInArray
{
    return @{@"pics_module" : [RJPictureCellPMObject class]};
}

@end