//
//  ServerModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "ServerManager.h"
#import "Message.h"

@implementation ServerManager

static ServerManager * theInstance;

+(ServerManager*)instance{
    if (theInstance == nil) {
        theInstance = [ServerManager alloc];
    }
    return theInstance;
}


-(NSMutableArray *)getMessagesByUserID:(NSInteger)userID{
    NSMutableArray * messages = [[NSMutableArray alloc]init];
    for (Message * message in self.messages) {
        if (message.userID == userID) {
            [messages addObject:message];
        }
    }
    return messages;
}

@end
