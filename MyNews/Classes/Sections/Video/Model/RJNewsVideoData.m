//
// Created by wjdtyp on 15/7/30.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import "RJNewsVideoData.h"
#import "RJNewsVideoDataObject.h"
#import "RJNewsVideoListt.h"


@implementation RJNewsVideoData {

}

+ (NSDictionary *)objectClassInArray
{
    return @{@"list" : [RJNewsVideoDataObject class]};
}

@end