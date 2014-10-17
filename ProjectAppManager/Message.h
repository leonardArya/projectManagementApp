//
//  Message.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
enum MessageTypes{reminder,calendar};

+(void)sendMessageToServer:(Message *)message;

@property NSInteger userID;
@property enum MessageTypes type;
@property NSString * title;
@property NSString * note;
@property NSDate * startDate;
@property NSDate * endDate;

-(void)outputLog;

-(Message*)initWithType:(enum MessageTypes)type title:(NSString *) title note:( NSString *) note date:(NSDate *) startDate;


@end
