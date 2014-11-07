//
//  CoreDataManager.m
//  ProjectAppManager
//
//  Created by Leonard Li on 10/27/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@implementation CoreDataManager

static CoreDataManager * instance;

+(CoreDataManager *)sharedInstance{
    if (instance ==nil) {
        instance = [[CoreDataManager alloc]init];
    }
    return instance;
}

//core data
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(void)initCoreData {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSNumber * memberid = [NSNumber numberWithInt:2];
    NSNumber * projectid = [NSNumber numberWithInt:2];
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newDevice setValue:memberid forKey:@"memberID"];
    [newDevice setValue:projectid forKey:@"projectID"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    //    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSMutableArray *)readEntity:(NSString *)entity {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest * request = [[NSFetchRequest alloc]initWithEntityName:entity];
    return[[context executeFetchRequest:request error:nil]mutableCopy];
}

-(NSMutableArray *)readEntity:(NSString *)entity withPredicate:(NSString *)predicationString{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest * request = [[NSFetchRequest alloc]initWithEntityName:entity];
    NSPredicate * predication = [NSPredicate predicateWithFormat:predicationString];
    [request setPredicate:predication];
    return[[context executeFetchRequest:request error:nil]mutableCopy];
}

-(void)writePorjectLog:(NSNumber *)projectID userID:(NSNumber *)userID memberID:(NSNumber* )memberID infoStr:(NSString *)infoStr{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest * request;
    NSPredicate * predication;
    NSMutableArray* result;
    //get user name and member name
    NSString * userName;
    NSString * memberName;
    NSString * log;
    
    request = [[NSFetchRequest alloc]initWithEntityName:@"Member"];
    predication = [NSPredicate predicateWithFormat:@"id == %@",userID];
    [request setPredicate:predication];
    result= [[context executeFetchRequest:request error:nil]mutableCopy];
    userName =[[result objectAtIndex:0] valueForKey:@"name"];
    
    request = [[NSFetchRequest alloc]initWithEntityName:@"Member"];
    predication = [NSPredicate predicateWithFormat:@"id == %@",memberID];
    [request setPredicate:predication];
    result= [[context executeFetchRequest:request error:nil]mutableCopy];
    memberName =[[result objectAtIndex:0] valueForKey:@"name"];
    //end of names
    
    request = [[NSFetchRequest alloc]initWithEntityName:@"Project"];
    predication = [NSPredicate predicateWithFormat:@"id == %@",projectID];
    [request setPredicate:predication];
    result = [[context executeFetchRequest:request error:nil]mutableCopy];
    log = [[NSString stringWithFormat:@"%@ made phone call to %@ \n",userName,memberName] stringByAppendingString:[[result objectAtIndex:0] valueForKey:@"log"]];
    [[result objectAtIndex:0] setValue:log forKey:@"log"];
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

@end
