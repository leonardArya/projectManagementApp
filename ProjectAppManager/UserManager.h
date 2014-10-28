//
//  UserModel.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserManager : NSObject


+(UserManager *)sharedInstance;

@property User * currentUser;
@property NSNumber * userSelectedID;

@property NSMutableArray * allUsers;
-(User *)getUserByID:(NSNumber*)userID;
-(User *)userLogin:(NSString*)userName password:(NSString*)password;

@end
