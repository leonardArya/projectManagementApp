//
//  DropboxManager.h
//  ProjectAppManager
//
//  Created by Leonard Li on 11/10/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DropboxManager : NSObject

+(DropboxManager*)sharedInstance;

@property NSString * selectedURL;
@end
