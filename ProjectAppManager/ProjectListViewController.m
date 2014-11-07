//
//  ProjectListViewController.m
//  ProjectAppManager
//
//  Created by clark Lyu on 10/20/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "ProjectListViewController.h"
#import "CoreDataManager.h"
#import "ProjectManager.h"
#import "UserManager.h"
#import "MemberListViewController.h"

@interface ProjectListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *projectListTableView;

@end

@implementation ProjectListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.projects = [[ProjectManager sharedInstance] getProjectsByUserID:[UserManager sharedInstance].currentUser.userID];
    [self.projectListTableView setSeparatorColor:[UIColor lightGrayColor]];
    [UserManager sharedInstance].currentUser.projects = self.projects;
    self.navigationItem.title = @"Participating Projects";
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)inAnimated {
    NSIndexPath *selected = [self.projectListTableView indexPathForSelectedRow];
    if ( selected ) [self.projectListTableView deselectRowAtIndexPath:selected animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[[self.projects objectAtIndex:indexPath.row]valueForKey:@"name"];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.projects count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [ProjectManager sharedInstance].selectedProjectID = [[self.projects objectAtIndex:indexPath.row] valueForKey:@"id"];
    MemberListViewController * viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"memberList"];
    [self.navigationController pushViewController:viewController animated:YES];
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
