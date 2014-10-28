//
//  ReminderViewController.m
//  ProjectAppManager
//
//  Created by clark Lyu on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "ReminderViewController.h"
#import "Message.h"
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
