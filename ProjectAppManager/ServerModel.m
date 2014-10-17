//
//  ServerModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "ServerModel.h"

@implementation ServerModel

static ServerModel * theInstance;

+(ServerModel*)instance{
    if (theInstance == nil) {
        theInstance = [ServerModel alloc];
    }
    return theInstance;
}
@end
