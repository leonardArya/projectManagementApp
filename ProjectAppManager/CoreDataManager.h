//
//  CoreDataManager.h
//  ProjectAppManager
//
//  Created by Leonard Li on 10/27/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject
-(void)initCoreData;
+(CoreDataManager*)sharedInstance;
-(NSMutableArray *)readEntity:(NSString *)entity;
-(NSMutableArray *)readEntity:(NSString *)entity withPredicate:(NSString *)predicationString;
@end
