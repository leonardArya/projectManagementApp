//
//  MessageAPI.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/20/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

@interface MessageAPI : NSObject

+(void)sendMessageToServer:(Message *)message;
+(NSMutableArray*)getMessageFromServer;

@end
