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
#import <EventKit/EventKit.h>

@implementation MessageAPI

+(void)sendMessageToServer:(Message *)message{
    message.userID = [UserManager sharedInstance].userSelectedID;
    [[ServerManager sharedInstance].messages addObject:message];
    
    //    NSLog(@"total message in server:%lu",[ServerManager.instance.messages count]);
}

+(NSMutableArray*)getMessageFromServer{
    NSNumber * userID= [UserManager sharedInstance].currentUser.userID;
    return [[ServerManager sharedInstance] getMessagesByUserID:userID];
}

+(void)handelMessage:(Message *)message{
    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error)
                {
                }else if (!granted)
                {
                    //user doesn't give permission
                }else{
                    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
                    event.title = message.title;
                    event.startDate=message.startDate;
                    event.endDate = message.startDate;
                    event.notes = message.note;
                    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
                    NSError *err;
                    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
                }
            });
        }];
    }
}
@end