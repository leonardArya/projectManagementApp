//
//  MemberModel.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "MemberManager.h"
#import "CoreDataManager.h"

@implementation MemberManager

static MemberManager * instance;

+(MemberManager*)sharedInstance{
    if (instance == nil) {
        instance = [[MemberManager alloc]init];
    }
    return instance;
}

-(NSMutableArray *)getMemberByProjectID:(NSNumber*)projectID{
    NSMutableArray * memberIDs = [[CoreDataManager sharedInstance] readEntity:@"ProjectMemberRelationship" withPredicate:[NSString stringWithFormat:@"projectID == %@",projectID]];
    NSLog(@"find %ld members",[memberIDs count]);
    NSMutableArray * result = [[NSMutableArray alloc]init];
    for (id memberID in memberIDs) {
        NSLog(@"projectID = %@",[memberID valueForKey:@"memberID"]);
        [result addObjectsFromArray:[[CoreDataManager sharedInstance] readEntity:@"Member" withPredicate:[NSString stringWithFormat:@"id == %@",[memberID valueForKey:@"memberID"]]]];
    }
    return result;
}
@end
