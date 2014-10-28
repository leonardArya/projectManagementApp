//
//  MemberListViewController.m
//  ProjectAppManager
//
//  Created by clark Lyu on 10/20/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "MemberListViewController.h"
#import "MemberManager.h"
#import "UserManager.h"
#import "ReminderViewController.h"
#import "ProjectManager.h"


@interface MemberListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *memberListTableView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation MemberListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.members = [[MemberManager sharedInstance] getMemberByProjectID:[ProjectManager sharedInstance].selectedProjectID];
    self.detailLabel.text = [ProjectManager sharedInstance].selectedProjectDetail;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[[self.members valueForKey:@"name"] objectAtIndex:indexPath.row];
    NSLog(@"%@",[[self.members objectAtIndex:indexPath.row] valueForKey:@"name"]);
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.members count];
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [UserManager sharedInstance].userSelectedID = [[self.members objectAtIndex:indexPath.row] valueForKey:@"id"];
    ReminderViewController * reminderViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"reminderView"];
    [self.navigationController pushViewController:reminderViewController animated:YES];
    return indexPath;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
