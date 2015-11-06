//
// Created by wjdtyp on 15/7/30.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import "RJNewsNewsHeadLines.h"
#import "RJNewsNewsHeadLinesObject.h"


@implementation RJNewsNewsHeadLines {

}
+ (NSDictionary *)objectClassInArray
{
    return @{@"list" : [RJNewsNewsHeadLinesObject class]};
}
@end