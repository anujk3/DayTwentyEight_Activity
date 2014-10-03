//
//  ViewController.h
//  DayTwentyEight
//
//  Created by Anuj Katiyal on 04/10/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)tappedProcessStuff:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@end

