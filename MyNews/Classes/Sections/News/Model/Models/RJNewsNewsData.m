//
// Created by wjdtyp on 15/7/30.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import "RJNewsNewsData.h"
#import "RJNewsNewsListObject.h"
#import "RJNewsNewsList.h"


@implementation RJNewsNewsData {

}



+ (NSDictionary *)objectClassInArray
{
    return @{@"list" : [RJNewsNewsListObject class]};
}
@end