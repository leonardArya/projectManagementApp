//
//  UserModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "UserManager.h"
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"

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
    NSMutableArray * userData = [[CoreDataManager sharedInstance] readEntity:@"Member"];
    for (id user in userData) {
        if([userName compare:[user valueForKey:@"name"]]==0 && [password compare: [user valueForKey:@"password"]]==0){
            User * result = [[User alloc]init];
            result.userID = [(NSNumber*)[user valueForKey:@"id"] integerValue];
            NSLog(@"user ID =%ld",result.userID);
            result.userName = [user valueForKey:@"name"];
            return result;
        }
    }
    return nil;
}


@end
