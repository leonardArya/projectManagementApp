//
//  MassageModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "MessageManager.h"
#import "Message.h"
#import "ServerManager.h"
#import "UserManager.h"

@implementation MessageManager

+(void)sendMessageToServer:(Message *)message{
    message.userID = UserManager.instance.userSelected.userID;
    [ServerManager.instance.messages addObject:message];
}
@end

