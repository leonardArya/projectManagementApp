//
//  LoginViewController.m
//  ProjectAppManager
//
//  Created by clark Lyu on 10/20/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "LoginViewController.h"
#import "UserManager.h"
#import "ReminderViewController.h"
#import "ServerManager.h"
#import <CoreData/CoreData.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginBtnOnclick:(id)sender {
    [UserManager sharedInstance].currentUser = [[UserManager sharedInstance] userLogin:self.userNameText.text password:self.passwordText.text];
    if ([UserManager sharedInstance].currentUser!=nil) {
        NSLog(@"yes");
        ReminderViewController * reminderViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"reminderView"];
        [self.navigationController pushViewController:reminderViewController animated:YES];
        NSMutableArray * receivedMessages = [[ServerManager sharedInstance] getMessagesByUserID:[UserManager sharedInstance].currentUser.userID];
        NSLog(@"%ld",[receivedMessages count]);
        
    }else{
        NSLog(@"no");
    }
}


- (IBAction)refreshBtnOnclick:(id)sender {
}

//core data
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
return context;
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSNumber * memberid = [NSNumber numberWithInt:2];
    NSNumber * projectid = [NSNumber numberWithInt:2];
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newDevice setValue:memberid forKey:@"memberID"];
    [newDevice setValue:projectid forKey:@"projectID"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    //    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
