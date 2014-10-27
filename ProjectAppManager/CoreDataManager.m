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

//core data
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)save:(id)sender {
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
@end
