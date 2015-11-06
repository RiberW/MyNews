//
// Created by wjdtyp on 15/8/7.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJPictureCellData.h"
#import "RJPictureCellPM.h"
#import "RJPictureCellPMObject.h"
@implementation RJPictureCellData {

}
+ (NSDictionary *)objectClassInArray
{
    return @{@"pics_module" : [RJPictureCellPMObject class]};
}
@end