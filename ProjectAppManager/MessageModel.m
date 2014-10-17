//
//  MassageModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "MessageModel.h"
#import "Message.h"
#import "ServerModel.h"
#import "UserModel.h"

@implementation MessageModel

+(void)sendMessageToServer:(Message *)message{
    message.userID = UserModel.instance.userSelected.userID;
    [ServerModel.instance.messages addObject:message];
}
@end

