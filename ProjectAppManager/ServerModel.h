//
//  ServerModel.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerModel : NSObject

+(ServerModel *)instance;

@property NSMutableArray * messages;
-(NSMutableArray *)getMessagesByUserID:(NSInteger)userID;

@end
