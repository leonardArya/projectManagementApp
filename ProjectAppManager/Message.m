//
//  Message.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "Message.h"
#import "ServerManager.h"

@implementation Message


-(void)outputLog{
    NSLog(@"message: %ld,%u,%@,%@,%@,%@ ",(long)self.userID,self.type,self.title,self.note,self.startDate.description,self.endDate);
}


-(Message*)initWithType:(enum MessageTypes)type title:(NSString *) title note:( NSString *) note date:(NSDate *) startDate{
    self.type = type;
    self.title = title;
    self.note = note;
    self.startDate = startDate;
    return self;
}
@end
