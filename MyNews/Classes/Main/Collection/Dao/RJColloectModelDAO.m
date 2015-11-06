//
// Created by wjdtyp on 15/9/6.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <FMDB/FMDatabase.h>
#import "RJColloectModelDAO.h"
#import "RJColloectModel.h"
#import "RJNewsSingleton.h"

@implementation RJColloectModelDAO {

}

- (RJColloectModel *)findModel:(RJColloectModel *)m {
    FMDatabase *db = [RJNewsSingleton sharedRJNewsSingleton].db;
    FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM tb_collect WHERE model_url=?", m.url];
    NSMutableArray *models = [NSMutableArray array];
    while (resultSet.next) {
        RJColloectModel *model = [[RJColloectModel alloc] init];
        model.id = [resultSet objectForColumnName:@"model_id"];
        model.title = [resultSet objectForColumnName:@"model_title"];
        model.url = [resultSet objectForColumnName:@"model_url"];
        model.date = [resultSet objectForColumnName:@"model_date"];
        model.type = [resultSet objectForColumnName:@"model_type"];
        model.isLiked = [resultSet objectForColumnName:@"model_isLiked"];
        model.isCollected = [resultSet objectForColumnName:@"model_isCollected"];
        model.isShared = [resultSet objectForColumnName:@"model_isShared"];
        [models addObject:model];
    }
    if (models.count < 1) {
        [self addModel:m];
        return m;
    }
    return models[0];;
}

- (BOOL)addModel:(RJColloectModel *)model {
    FMDatabase *db = [RJNewsSingleton sharedRJNewsSingleton].db;
      BOOL flag=  [db executeUpdate:@"insert into tb_collect (model_id,model_url,model_title,model_date,model_isLiked,"
                                  "model_isCollected,model_isShared) values(?,?,?,?,?,?,?)",model.id,model.url,model.title,model.date,model.isLiked,model.isCollected,model.isShared];
    return flag;
}

- (BOOL)updateModel:(RJColloectModel *)model {
    FMDatabase *db = [RJNewsSingleton sharedRJNewsSingleton].db;
    BOOL flag =[db executeUpdate:@"update tb_collect set model_id=?,model_title=?,model_date=?,model_isLiked=?,model_isCollected=?,model_isShared=? where model_url=?",model.id,model.title,model.date,model.isLiked,model.isCollected,model.isShared,model.url];
    return flag;
}
@end