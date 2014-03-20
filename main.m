//
//  main.m
//  sqlitetest
//
//  Created by pfa on 3/6/14.
//  Copyright (c) 2014 pfa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "BrigadeDatabase.h"
#import "BrigadeInfo.h"

int main(int argc, char * argv[])
{
    NSLog(@"putelol\n");NSLog(@"putelol avant la boucle\n");
//   NSArray *BrigadeInfos
    //BrigadeDatabase *toto
    NSArray *BrigadeInfos =
    [[BrigadeDatabase database]  findBrigadeByNameWithString:@"Montpellier"];//.BrigadeInfos;
   // [[BrigadeDatabase alloc] init];
    //NSArray *BrigadeInfos = [toto BrigadeInfos];
    NSLog(@"putelol après build object\n");
//    BrigadeInfos[0].Id;
    for (BrigadeInfo *info in BrigadeInfos)
    {
       // NSLog(@"dans la boucle lol\n");
        NSLog(@"%@, %@, %@", info.Id, info.TPH, info.CU_unite_surveillance);
    }
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
