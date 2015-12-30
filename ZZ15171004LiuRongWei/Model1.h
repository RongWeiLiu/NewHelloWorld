//
//  Model1.h
//  ZZ15171004LiuRongWei
//
//  Created by qianfeng on 15/12/12.
//  Copyright © 2015年 刘镕玮. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol listModel <NSObject>

@end
@interface listModel : JSONModel
@property (nonatomic, copy) NSString *listId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *pub_time;
@end
@interface Model1 : JSONModel
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSMutableArray<listModel> *list;
@end
