//
//  ViewController.m
//  RealmCrashSample
//
//  Created by sakamoto kazuhiro on 2016/03/09.
//  Copyright © 2016年 Sakamoto Kazuhiro. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "RealmCrashSample-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self crashTest];
}

- (void)crashTest {
    Person *person = [Person new];
    RLMRealm *realm    = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:person];
    }];
    
    Person *managedPerson = [Person allObjects].firstObject;
    NSLog(@"MANAGED PERSON %@", managedPerson);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
