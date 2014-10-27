//
//  UserModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "UserManager.h"
#import <CoreData/CoreData.h>

@implementation UserManager

static UserManager * instance;

+(UserManager*)sharedInstance{
    if (instance == nil) {
        instance = [[UserManager alloc]init];
    }
    return instance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.allUsers = [[NSMutableArray alloc]init];
    }
    return self;
}


-(User *)getUserByID:(NSInteger)userID{
    for (User * user in self.allUsers) {
        if (user.userID == userID) return user;
    }
    return nil;
}

-(User *)userLogin:(NSString*)userName password:(NSString*)password{

    for (User * user in self.allUsers) {
        if ([user.userName compare:userName]==0 && [user.password compare:password]==0) return user;
    }
    return nil;
}


@end
