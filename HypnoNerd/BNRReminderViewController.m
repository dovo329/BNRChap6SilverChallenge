//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Douglas Voss on 4/14/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()

@property (nonatomic,weak) IBOutlet UIDatePicker *datePicker;

@end


@implementation BNRReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Reminder";
        
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = image;
    }
    return self;
}

- (IBAction)remindMeButton:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"remind me at %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRReminderController loaded its view.");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
