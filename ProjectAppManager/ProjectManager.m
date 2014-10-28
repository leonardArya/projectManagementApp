//
//  ProjectModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "ProjectManager.h"
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"

@implementation ProjectManager

static ProjectManager * instance;

+(ProjectManager*)sharedInstance{
    if (instance == nil) {
        instance = [[ProjectManager alloc]init];
    }
    return instance;
}

-(NSMutableArray *)getProjectsByUserID:(NSInteger)userID{
    NSLog(@"userID = %ld",userID);
    NSMutableArray * projectIDs = [[CoreDataManager sharedInstance] readEntity:@"ProjectMemberRelationship" withPredicate:[NSString stringWithFormat:@"memberID == %ld",userID]];
    NSLog(@"got %ld projects",[projectIDs count]);
    NSMutableArray * result = [[NSMutableArray alloc]init];
    for (id projectID in projectIDs) {
        NSLog(@"projectID = %@",[projectID valueForKey:@"projectID"]);
       [result addObjectsFromArray:[[CoreDataManager sharedInstance] readEntity:@"Project" withPredicate:[NSString stringWithFormat:@"id == %@",[projectID valueForKey:@"projectID"]]]];
        }
    return result;
}
@end
