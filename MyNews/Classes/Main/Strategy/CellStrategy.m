//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <objc/runtime.h>
#import "CellStrategy.h"
#import "RJCustomCell.h"
#import "RJNews.h"
#import "RJNewsNewsListObject.h"
#import "SDCycleScrollView.h"

@implementation CellStrategy {


}

static CGFloat cellHeight;

+ (void)initialize {
    cellHeight = 0;
}

- (instancetype)initWithData:(id)data {
    self = [super init];
    if (self) {
        if ([data isKindOfClass:[NSArray class]]) {
            self = [[CellStrategy alloc] init];
            self.category = @"NSArray";
            self.data = data;
            return self;
        }
        NSString *category = [self getCellCategory:data];
        NSString *stringClass = [[category uppercaseString] stringByAppendingFormat:@"CellStrategy"];
        self = [[NSClassFromString(stringClass) alloc] init];
        self.category = category;
        self.data = data;
    }
    return self;
}

- (BOOL)isContainsKey:(id)data {
    unsigned int numIvars;
    Ivar *vars = class_copyIvarList([data class], &numIvars);
    NSString *key = nil;
    for (int i = 0; i < numIvars; i++) {
        Ivar thisIvar = vars[i];
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        if ([key isEqualToString:@"_video_info"]) {
            id result= [data valueForKey:@"video_info"];
            return result != nil;
        }
    }
    free(vars);
    return NO;
}


- (NSString *)getCellCategory:(id)data {
    NSString *category = [data valueForKeyPath:@"category"];
    if ([category isEqualToString:@"video"]) {
        if ([self isContainsKey:data]) {
            return @"video";
        } else {
            return nil;
        }
    } else {
        return category;
    }
}

- (RJCustomCell *)loadNibName {
    if ([self.data isKindOfClass:[NSArray class]]) {
        NSArray *array = self.data;
        NSMutableArray *arryURL = [NSMutableArray arrayWithCapacity:5];
        NSMutableArray *arryTitle = [NSMutableArray arrayWithCapacity:5];
        for (RJNewsNewsListObject *obj in array) {
            NSURL *url = [NSURL URLWithString:obj.kpic];
            [arryURL addObject:url];
            [arryTitle addObject:obj.long_title];
        }
        CGRect frame = CGRectMake(0, 0, RJScreenW, YRF(180));
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame imageURLsGroup:arryURL];
        cycleScrollView.autoScrollTimeInterval = array.count;
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView.titlesGroup = arryTitle;
        RJCustomCell *cell = [[RJCustomCell alloc] initWithFrame:frame];
        cell.cycleScrollView = cycleScrollView;
        [cell.contentView addSubview:cycleScrollView];
        return cell;
    }
    RJCustomCell *cell = [[RJCustomCell alloc] init];
    return cell;
}

- (CGFloat)getHeight {
    if ([self.data isKindOfClass:[NSArray class]]) {
        return (CGFloat) (YRF(180));
    }
    return cellHeight;
}

- (UIViewController *)createController {
    return nil;
}
@end