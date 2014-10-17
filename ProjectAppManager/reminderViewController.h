//
//  reminderViewController.h
//  ProjectAppManager
//
//  Created by clark Lyu on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reminderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *reminderTitle;
@property (weak, nonatomic) IBOutlet UITextView *noteField;
@property (weak, nonatomic) IBOutlet UITextField *reminderYear;
@property (weak, nonatomic) IBOutlet UITextField *reminderMonth;
@property (weak, nonatomic) IBOutlet UITextField *reminderDay;
@property (weak, nonatomic) IBOutlet UITextField *reminderTime;

@end
