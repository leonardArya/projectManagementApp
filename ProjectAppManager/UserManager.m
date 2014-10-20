//
//  UserModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

static UserManager * theInstance;

+(UserManager*)instance{
    if (theInstance == nil) {
        theInstance = [UserManager alloc];
    }
    return theInstance;
}


@end
