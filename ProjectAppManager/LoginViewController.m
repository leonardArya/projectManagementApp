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
#import "ProjectListViewController.h"
#import "CoreDataManager.h"
#import "MessageAPI.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[CoreDataManager sharedInstance] initCoreData];
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
        NSLog(@"correct");
        
        NSMutableArray * receivedMessages = [[ServerManager sharedInstance] getMessagesByUserID:[UserManager sharedInstance].currentUser.userID];
        NSLog(@"you got%ld messages",[receivedMessages count]);
        for (Message * msg in receivedMessages) {
            [MessageAPI handelMessage:msg];
        }
        //next VC
        ProjectListViewController * projectListViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"projectList"];
        [self.navigationController pushViewController:projectListViewController animated:YES];
    }else{
        NSLog(@"no");
    }
}

- (IBAction)refreshBtnOnclick:(id)sender {
}

@end
