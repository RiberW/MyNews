//
// Created by wjdtyp on 15/7/30.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import "RJNewsNewsPics.h"
#import "RJNewsNewsPicsListObject.h"
#import "RJNewsNewsPicsList.h"


@implementation RJNewsNewsPics {

}


+ (NSDictionary *)objectClassInArray
{
    return @{@"list" : [RJNewsNewsPicsListObject class]};
}
@end