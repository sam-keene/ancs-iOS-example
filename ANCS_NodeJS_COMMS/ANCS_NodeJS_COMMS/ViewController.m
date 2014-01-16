//
//  ViewController.m
//  ANCS_NodeJS_COMMS
//
//  Created by Sam Keene on 1/15/14.
//  Copyright (c) 2014 Sam Keene. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
}

// Fire a local notification for the Notification Consumer, in this case NodeJS app running on Mac OSX to respond to
- (IBAction)fireNotification:(id)sender
{
    UIApplication *app                = [UIApplication sharedApplication];
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    if (notification == nil)return;
    
    notification.alertBody = @"This is the notification alertBody";
    notification.alertAction = @"notification alertAction";
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber = 1;
    
    [app presentLocalNotificationNow:notification];
    
}

// Required delegate method
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"STARTED ADVERTISING");
        [self.peripheralManager startAdvertising:@{ CBAdvertisementDataLocalNameKey: [[UIDevice currentDevice] name] }];
                                                   
                                                   
    } else {
        NSLog(@"STOP ADVERTISING");
        [self.peripheralManager stopAdvertising];
    }
}

@end
