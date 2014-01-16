//
//  ViewController.h
//  ANCS_NodeJS_COMMS
//
//  Created by Sam Keene on 1/15/14.
//  Copyright (c) 2014 Sam Keene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController <CBPeripheralManagerDelegate>

@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@end
