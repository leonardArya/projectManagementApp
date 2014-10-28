//
//  User.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectManager.h"
#import "MessageManager.h"

@interface User : NSObject

@property NSNumber * userID;
@property NSString * userName;
@property NSString * password;

@property NSMutableArray * projects;
@property NSMutableArray * messages;

@end
