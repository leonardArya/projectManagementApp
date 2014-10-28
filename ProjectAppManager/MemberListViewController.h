//
//  MemberListViewController.h
//  ProjectAppManager
//
//  Created by clark Lyu on 10/20/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property NSMutableArray * members;
@end
