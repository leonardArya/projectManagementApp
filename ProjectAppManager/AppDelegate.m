//
//  AppDelegate.m
//  ProjectAppManager
//
//  Created by clark Lyu on 10/17/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "AppDelegate.h"
#import "User.h"
#import "UserManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self initDataBase];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)initTestData{
    
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.LLApp.CoreDataTest" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ProjectAppManager.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma init DataBase
-(void)initDataBase{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    // Create a new managed object
    
    //Project
    //one recored
    NSManagedObject *newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:1] forKey:@"id"];
    [newRecord setValue:@"Project1" forKey:@"name"];
    [newRecord setValue:@"this is a project" forKey:@"detail"];
    [newRecord setValue:@"this is a log" forKey:@"log"];
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:2] forKey:@"id"];
    [newRecord setValue:@"Project2" forKey:@"name"];
    [newRecord setValue:@"this is a project" forKey:@"detail"];
    [newRecord setValue:@"this is a log" forKey:@"log"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:3] forKey:@"id"];
    [newRecord setValue:@"Project3" forKey:@"name"];
    [newRecord setValue:@"this is a project" forKey:@"detail"];
    [newRecord setValue:@"this is a log" forKey:@"log"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //Member
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"Member" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:1] forKey:@"id"];
    [newRecord setValue:@"jack" forKey:@"name"];
    [newRecord setValue:@"pw" forKey:@"password"];
    [newRecord setValue:@"jack123@gmail.com" forKey:@"email"];
    [newRecord setValue:@"5101231234" forKey:@"phone"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"Member" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:2] forKey:@"id"];
    [newRecord setValue:@"tom" forKey:@"name"];
    [newRecord setValue:@"pw" forKey:@"password"];
    [newRecord setValue:@"tom.personal@gmail.com" forKey:@"email"];
    [newRecord setValue:@"51012345212" forKey:@"phone"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"Member" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:3] forKey:@"id"];
    [newRecord setValue:@"mike" forKey:@"name"];
    [newRecord setValue:@"pw" forKey:@"password"];
    [newRecord setValue:@"mikelin@gmail.com" forKey:@"email"];
    [newRecord setValue:@"5101235462" forKey:@"phone"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    //Relationship
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:1] forKey:@"memberID"];
    [newRecord setValue:[NSNumber numberWithInt:1] forKey:@"projectID"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:1] forKey:@"memberID"];
    [newRecord setValue:[NSNumber numberWithInt:2] forKey:@"projectID"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:2] forKey:@"memberID"];
    [newRecord setValue:[NSNumber numberWithInt:1] forKey:@"projectID"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:2] forKey:@"memberID"];
    [newRecord setValue:[NSNumber numberWithInt:2] forKey:@"projectID"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:3] forKey:@"memberID"];
    [newRecord setValue:[NSNumber numberWithInt:1] forKey:@"projectID"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:3] forKey:@"memberID"];
    [newRecord setValue:[NSNumber numberWithInt:2] forKey:@"projectID"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    //one recored
    newRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ProjectMemberRelationship" inManagedObjectContext:context];
    [newRecord setValue:[NSNumber numberWithInt:3] forKey:@"memberID"];
    [newRecord setValue:[NSNumber numberWithInt:3] forKey:@"projectID"];
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

@end
