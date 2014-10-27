//
//  MassageModel.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

@interface MessageManager : NSObject

+(void)handleMessage:(Message*)message;
@end
