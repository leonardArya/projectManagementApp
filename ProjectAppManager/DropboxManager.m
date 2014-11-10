//
//  DropboxManager.m
//  ProjectAppManager
//
//  Created by Leonard Li on 11/10/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "DropboxManager.h"

@implementation DropboxManager
static DropboxManager * instance;

+(DropboxManager*)sharedInstance{
    if (instance ==nil) {
        instance = [[DropboxManager alloc]init];
    }
    return instance;
}


@end
