//
//  MemberViewController.m
//  ProjectAppManager
//
//  Created by clark Lyu on 10/20/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "MemberViewController.h"
#import "UserManager.h"
#import "CoreDataManager.h"
#import "UserManager.h"

@interface MemberViewController ()
@property (weak, nonatomic) IBOutlet UITextView *memberDetailText;
@end

@implementation MemberViewController
NSString * phone;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNumber * userID = [UserManager sharedInstance].userSelectedID;
    NSString * predicateStr = [NSString stringWithFormat:@"id == %@",userID];
    NSMutableArray * member = [[CoreDataManager sharedInstance]readEntity:@"Member" withPredicate:predicateStr];
    NSString * name = [[member objectAtIndex:0]valueForKey:@"name"];
    NSString * email = [[member objectAtIndex:0] valueForKey:@"email"];
    phone = [[member objectAtIndex:0] valueForKey:@"phone"];
    NSLog(@"%@%@",email,@"tom.personal@gmail.com");
    self.memberDetailText.text = [name stringByAppendingString:[email stringByAppendingString:phone]];
    
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
- (IBAction)setReminderBtnOnclick:(id)sender {
    
}

- (IBAction)setCalendarOnclick:(id)sender {
}

- (IBAction)phoneCallButtonOnClick:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phone]]];
    NSNumber * projectID = [ProjectManager sharedInstance].selectedProjectID;
    NSNumber * userID = [UserManager sharedInstance].currentUser.userID;
    NSNumber * memberID = [UserManager sharedInstance].userSelectedID;
    [[CoreDataManager sharedInstance] writePorjectLog:projectID userID:userID memberID:memberID infoStr:@"log info"];
}

@end
