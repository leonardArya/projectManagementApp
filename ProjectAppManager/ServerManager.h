//
//  ServerModel.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerManager : NSObject

+(ServerManager *)sharedInstance;

@property NSMutableArray * messages;
-(NSMutableArray *)getMessagesByUserID:(NSNumber*)userID;

@end
