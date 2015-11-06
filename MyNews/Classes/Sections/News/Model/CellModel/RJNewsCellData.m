//
// Created by wjdtyp on 15/8/9.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJNewsCellData.h"
#import "RJNewsCellDataKeys.h"
#import "RJNewsCellDataVM.h"
#import "RJNewsCellDataPics.h"
#import "RJNewsCellDataVMObject.h"
#import "RJNewsCellDataPicsObject.h"


@implementation RJNewsCellData {

}
+ (NSDictionary *)objectClassInArray
{
    return @{
              @"videos_module" : [RJNewsCellDataVMObject class],
              @"pics" : [RJNewsCellDataPicsObject class]
     };
}
@end