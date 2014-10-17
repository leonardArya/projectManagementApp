//
//  Message.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "Message.h"
#import "ServerModel.h"

@implementation Message

+(void)sendMessageToServer:(Message *)message{
    [ServerModel.instance.messages addObject:message];
}

-(void)outputLog{
    NSLog(@"message: %ld,%u,%@,%@,%@,%@ ",(long)self.userID,self.type,self.title,self.note,self.startDate,self.endDate);
}


-(Message*)initWithType:(enum MessageTypes)type title:(NSString *) title note:( NSString *) note date:(NSDate *) startDate{
    self.type = type;
    self.title = title;
    self.note = note;
    self.startDate = startDate;
    return self;
}
@end
