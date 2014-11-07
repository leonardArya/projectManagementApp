//
//  ProjectManager.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectManager : NSObject
+(ProjectManager*)sharedInstance;
-(NSMutableArray *)getProjectsByUserID:(NSNumber *)userID;
@property NSNumber * selectedProjectID;
@property NSString * selectedProjectDetail;
@property NSString * selectedProjectLog;

@end
