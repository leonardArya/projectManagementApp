//
//  ServerModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "ServerModel.h"
#import "Message.h"

@implementation ServerModel

static ServerModel * theInstance;

+(ServerModel*)instance{
    if (theInstance == nil) {
        theInstance = [ServerModel alloc];
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
