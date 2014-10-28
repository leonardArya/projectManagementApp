//
//  ReminderViewController.m
//  ProjectAppManager
//
//  Created by clark Lyu on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "ReminderViewController.h"
#import "Message.h"
#import <EventKit/EventKit.h>
#import "MessageAPI.h"

@interface ReminderViewController()<UITextViewDelegate>


@end



@implementation ReminderViewController

@synthesize reminderNoteField, reminderTitle, datePk, theDateLabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    reminderNoteField.text = @"notes...";
    reminderNoteField.textColor = [UIColor lightGrayColor];
    self.reminderNoteField.delegate = self;
    // Do any additional setup after loading the view.
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"test");
    reminderNoteField.text = @"";
    reminderNoteField.textColor = [UIColor blackColor];
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(reminderNoteField.text.length == 0){
        reminderNoteField.textColor = [UIColor lightGrayColor];
        reminderNoteField.text = @"notes...";
       
    }
}




- (IBAction)remindSendBtn:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSLog(@"helo");
    self.theDateLabel.text = [dateFormatter stringFromDate:self.datePk.date];
    NSLog(@"%@",self.theDateLabel.text);
    Message * reminderMessage = [Message alloc];
    
    reminderMessage.type = reminder;
    reminderMessage.title = self.reminderTitle.text;
    reminderMessage.note = self.reminderNoteField.text;
    reminderMessage.startDate = self.datePk.date;
    [MessageAPI sendMessageToServer:reminderMessage];
    

    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    EKReminder *reminder = [EKReminder reminderWithEventStore:eventStore];
    
    [reminder setTitle:reminderMessage.title];
    [reminder setNotes:reminderMessage.note];
    EKAlarm *enterAlarm = [[EKAlarm alloc] init];
    [enterAlarm setProximity:EKAlarmProximityEnter];
    [reminder addAlarm:enterAlarm];
    enterAlarm.absoluteDate = reminderMessage.startDate;
    
    
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
        //等待用户是否同意授权日历
        //EKEntityMaskEvent提醒事项参数（该参数只能真机使用）  EKEntityTypeEvent日历时间提醒参数
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error)
                {
                }else if (!granted)
                {
                    //被⽤用户拒绝,不允许访问⽇日历
                    
                }else{
                
                EKEvent *event = [EKEvent eventWithEventStore:eventStore];
                    event.title = reminderMessage.title;
                    event.startDate=reminderMessage.startDate;
                    event.endDate = reminderMessage.startDate;
                    event.notes = reminderMessage.note;
                    
                    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
                    NSError *err;
                    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];

                    
                    NSLog(@"保存成功");
                   
                        EKCalendar * iDefaultCalendar = [eventStore defaultCalendarForNewReminders];
                        
                        EKReminder *reminder=[EKReminder reminderWithEventStore:eventStore];
                        reminder.calendar=[eventStore defaultCalendarForNewReminders];
                        
                        reminder.title=reminderMessage.title;
                        reminder.calendar = iDefaultCalendar;
                        NSError *error=nil;
                        
                        
                        [eventStore saveReminder:reminder commit:YES error:&error];
                        if (error) {
                            
                            NSLog(@"error=%@",error);
                            
                        }
               
                    
                        
                    }
                
                
            });
        }];
        
    }
    
    [reminderMessage outputLog];
    
}

-(IBAction)cancelButtonOnClick:(id)sender{
    NSLog(@"%@",@"cancel test");
    NSMutableArray * messages = [MessageAPI getMessageFromServer];
    for (Message * msg in messages) {
        NSLog(@"%@",msg.title);
    }
}
- (IBAction)datePickerValueChanged:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    self.theDateLabel.text = [dateFormatter stringFromDate:self.datePk.date];
   
}



@end
