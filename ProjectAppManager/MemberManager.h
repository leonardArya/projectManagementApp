//
//  MemberModel.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberManager : NSObject

+(MemberManager*)sharedInstance;
-(NSMutableArray *)getMemberByProjectID:(NSNumber*)projectID;
@end
