#import <UIKit/UIKit.h>
#import "RJNewsTypeScrollView.h"
#import "CoreStatusProtocol.h"

@class MJRefreshBackNormalFooter;
@class MJRefreshNormalHeader;
@class RJRequestParam;

@interface RJNewsTypeController : UIViewController <RJNewsTypeScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) RJNewsTypeButton *selectBtn;
@property(nonatomic, strong) MJRefreshBackNormalFooter *footer;
@property(nonatomic, strong) MJRefreshNormalHeader *header;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataSource;
@property(nonatomic, strong) NSMutableArray *dataFrames;
@property(nonatomic, assign) NSUInteger page;
@property(nonatomic, strong) RJRequestParam *param;

//params in order to multiplex
@property(nonatomic, strong) Class jsonToModel;
@property(nonatomic, strong) NSString *keyPath;

- (void)setupNewsTypeScrollView:(NSArray *)array;

- (void)refresh;
@end