//
// Created by wjdtyp on 15/8/10.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJNewsCellDataVMObject.h"
#import "RJNewsCellDataVMData.h"
#import "RJNewsCellDataVMObjectData.h"


@implementation RJNewsCellDataVMObject {

}
+ (NSDictionary *)objectClassInArray
{
    return @{@"data" : [RJNewsCellDataVMObjectData class]};
}


@end