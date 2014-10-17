//
//  reminderViewController.m
//  ProjectAppManager
//
//  Created by clark Lyu on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "reminderViewController.h"
#import "Message.h"
#import <EventKit/EventKit.h>

@interface reminderViewController ()

@property (weak, nonatomic) IBOutlet UITextField *reminderTitle;
@property (weak, nonatomic) IBOutlet UITextView *reminderNoteField;
@property (weak, nonatomic) IBOutlet UITextField *reminderYear;
@property (weak, nonatomic) IBOutlet UITextField *reminderMonth;
@property (weak, nonatomic) IBOutlet UITextField *reminderDay;
@property (weak, nonatomic) IBOutlet UITextField *reminderTime;

@end



@implementation reminderViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    Message * reminderMessage = [Message alloc];
    reminderMessage.type = reminder;
    reminderMessage.title;
    reminderMessage.note;
    reminderMessage.startDate;
    reminderMessage.endDate;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)remindSendBtn:(id)sender {
    
    EKEventStore *eventStore = [[EKEventStore alloc]init];
    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
    Message * reminderMessage = [Message alloc];
    reminderMessage.type = reminder;
    reminderMessage.title = self.reminderTitle.text;
    reminderMessage.note = self.reminderNoteField.text;
        [reminderMessage outputLog];
    NSLog(@"HELLO");
    
    NSString *yearString = self.reminderYear.text;
    NSString *monthString = self.reminderMonth.text;
    NSString *dayString = self.reminderDay.text;
    NSString *timeString = self.reminderTime.text;
      NSLog(@"HELLO2");
    NSString *dateString = [NSString stringWithFormat:@"%@,%@,%@,%@",yearString,monthString,dayString,timeString];
      NSLog(@"%@",dateString);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
      NSLog(@"HELLO4");
    [dateFormatter setDateFormat:@"YYYY-MM-DD hh:mm:ss"];
    NSDate *dateFromString = [[NSDate alloc] init];
      NSLog(@"HELLO5");
    dateFromString = [dateFormatter dateFromString:dateString];
      NSLog(@"HELLO6");
    
    
}

@end
