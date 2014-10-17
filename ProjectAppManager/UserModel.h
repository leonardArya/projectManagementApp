//
//  UserModel.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserModel : NSObject


+(UserModel *)instance;

@property User * currentUser;
@property User * userSelected;

@property NSMutableArray * allUsers;
@end
