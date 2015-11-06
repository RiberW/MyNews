//
// Created by wjdtyp on 15/8/1.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import "RJNewsPictureData.h"
#import "RJNewsPictureListObject.h"
#import "RJNewsPictureList.h"


@implementation RJNewsPictureData {

}

+ (NSDictionary *)objectClassInArray
{
    return @{@"list" : [RJNewsPictureListObject class]};
}
@end