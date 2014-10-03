//
//  ViewController.m
//  DayTwentyEight
//
//  Created by Anuj Katiyal on 04/10/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedProcessStuff:(id)sender {
    [self.indicator startAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSLog(@"Start");
        //Do EXTREME PROCESSING!!!
        for (int i = 0; i< 100; i++) {
            [NSThread sleepForTimeInterval:.05];
            NSLog(@"%i", i);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateProgressBar:i];
            });
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self backgroundDone];
        });
    });
}

- (void)updateProgressBar:(int)count {
    float progress = count/100.0;
    [self.progressBar setProgress:progress];
}

- (void)backgroundDone{
    [self.indicator stopAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"Done");
}

@end
