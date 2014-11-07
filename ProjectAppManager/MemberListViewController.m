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
#import "MemberViewController.h"
#import "ProjectManager.h"
#import "CoreDataManager.h"


@interface MemberListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *memberListTableView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITextView *projectLogTextField;

@end

@implementation MemberListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    NSMutableArray * selectedProject = [[CoreDataManager sharedInstance]readEntity:@"Project" withPredicate:[NSString stringWithFormat:@"id == %@",[ProjectManager sharedInstance].selectedProjectID]];
    [ProjectManager sharedInstance].selectedProjectDetail =[[selectedProject objectAtIndex:0] valueForKey:@"detail"];
    [ProjectManager sharedInstance].selectedProjectLog =[[selectedProject objectAtIndex:0] valueForKey:@"log"];
    self.members = [[MemberManager sharedInstance] getMemberByProjectID:[ProjectManager sharedInstance].selectedProjectID];
    self.detailLabel.text = [ProjectManager sharedInstance].selectedProjectDetail;
    self.projectLogTextField.text = [ProjectManager sharedInstance].selectedProjectLog;
    
    //deselect tablecell
    NSIndexPath *selected = [self.memberListTableView indexPathForSelectedRow];
    if ( selected ) [self.memberListTableView deselectRowAtIndexPath:selected animated:YES];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [UserManager sharedInstance].userSelectedID = [[self.members objectAtIndex:indexPath.row] valueForKey:@"id"];
    MemberViewController * memberViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MemberInfo"];
    [self.navigationController pushViewController:memberViewController animated:YES];
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
