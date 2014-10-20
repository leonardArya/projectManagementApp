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

@property NSInteger userID;

@property ProjectManager * projects;
@property MessageManager * messages;

@end
