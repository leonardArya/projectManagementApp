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

+(ServerManager*)sharedInstance{
    if (theInstance == nil) {
        theInstance = [ServerManager alloc];
        theInstance.messages = [[NSMutableArray alloc] init];
    }
    return theInstance;
}


-(NSMutableArray *)getMessagesByUserID:(NSNumber *)userID{
    NSMutableArray * messages = [[NSMutableArray alloc]init];
    NSMutableArray * remain   = [[NSMutableArray alloc]init];
    for (Message * message in self.messages) {
        if (message.userID == userID) {
            [messages addObject:message];
        }else{
            [remain addObject:message];
        }
    }
    self.messages = remain;
    return messages;
}

@end
