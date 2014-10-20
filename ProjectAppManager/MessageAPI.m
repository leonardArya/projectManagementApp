//
//  MessageAPI.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/20/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "MessageAPI.h"
#import "MessageManager.h"
#import "Message.h"
#import "ServerManager.h"
#import "UserManager.h"

@implementation MessageAPI

+(void)sendMessageToServer:(Message *)message{
    message.userID = UserManager.instance.userSelected.userID;
    [ServerManager.instance.messages addObject:message];
    
//    NSLog(@"total message in server:%lu",[ServerManager.instance.messages count]);
}

+(NSMutableArray*)getMessageFromServer{
    NSInteger userID= UserManager.instance.currentUser.userID;
    return [ServerManager.instance getMessagesByUserID:userID];
}
@end