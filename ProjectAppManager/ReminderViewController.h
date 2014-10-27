//
//  ReminderViewController.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/20/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderViewController : UIViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *reminderTitle;
@property (weak, nonatomic) IBOutlet UITextView *reminderNoteField;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePk;
@property (weak, nonatomic) IBOutlet UILabel *theDateLabel;

@end
