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
    // RLMObjectを新規作成
    Person *person = [Person new];
    RLMRealm *realm    = [RLMRealm defaultRealm];
    
    // RLMObjectを保存
    [realm transactionWithBlock:^{
        [realm addObject:person];
    }];
   
    // ManagedなRLMObjectを取得
    Person *managedPerson = [Person allObjects].firstObject;
    NSLog(@"MANAGED PERSON %@", managedPerson);
    // managedPersonがdeallocされるタイミングで必ずクラッシュする
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
