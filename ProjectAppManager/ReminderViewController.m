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
#import "MessageAPI.h"

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)remindSendBtn:(id)sender {
    Message * reminderMessage = [Message alloc];
    
    reminderMessage.type = reminder;
    reminderMessage.title = self.reminderTitle.text;
    reminderMessage.note = self.reminderNoteField.text;
    
    NSString *yearString = self.reminderYear.text;
    NSString *monthString = self.reminderMonth.text;
    NSString *dayString = self.reminderDay.text;
    NSString *timeString = self.reminderTime.text;
    NSString *dateString = [NSString stringWithFormat:@"%@-%@-%@ %@",yearString,monthString,dayString,timeString];
    NSLog(@"%@", dateString);
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];
    
    reminderMessage.startDate = dateFromString;
    [MessageAPI sendMessageToServer:reminderMessage];
    
    [reminderMessage outputLog];
    
}

-(IBAction)cancelButtonOnClick:(id)sender{
    NSLog(@"%@",@"cancel test");
    NSMutableArray * messages = [MessageAPI getMessageFromServer];
    for (Message * msg in messages) {
        NSLog(@"%@",msg.title);
    }
}

@end
