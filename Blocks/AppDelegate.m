//
//  AppDelegate.m
//  Blocks
//
//  Created by EnzoF on 05.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "AppDelegate.h"
typedef void (^BlockNotParametre)(void);
typedef void (^BlockWithParametre)(NSString*);
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BlockNotParametre blockNP= ^{
        NSLog(@"BlockNotParametre - Привет!!!");
    };
    
    BlockWithParametre  blockWP = ^(NSString *string){
        NSLog(@"BlockWithParametre - %@",string);
    };
    
    blockNP();
    blockWP(@"Hello");
    
    [self methodWithBlockNP:blockNP];
    [self methodWithBlockWP:blockWP];
    
    [self methodWithBlockWPAndArg:blockWP
                      greetingStr:@"Ciao"];
    // Override point for customization after application launch.
    return YES;
}

#pragma MARK -metods-
- (void)methodWithBlockNP:(void(^)(void)) blockWithString{
    blockWithString();
    blockWithString();
    blockWithString();
}
- (void)methodWithBlockWP:(void(^)(NSString *string)) blockWithString{
    blockWithString(@"methodWithBlockWP - Привет");
    blockWithString(@"methodWithBlockWP - Hello");
    blockWithString(@"methodWithBlockWP - Ciao");
}

- (void)methodWithBlockWPAndArg:(void(^)(NSString *string)) blockWithString greetingStr:(NSString*)greetingStr{
    blockWithString([NSString stringWithFormat:@"methodWithBlockWPAndArg - %@",greetingStr]);
}


@end
