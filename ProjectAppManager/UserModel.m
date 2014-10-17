//
//  UserModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

static UserModel * theInstance;

+(UserModel*)instance{
    if (theInstance == nil) {
        theInstance = [UserModel alloc];
    }
    return theInstance;
}


@end
