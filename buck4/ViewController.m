//
//  ViewController.m
//  buck4
//
//  Created by Elizabeth Borchardt on 10/11/16.
//  Copyright © 2016 Elizabeth Borchardt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) IBOutlet UILabel *timerLabel;
@property (nonatomic) IBOutlet UILabel *scoreLabel;
@property NSInteger count;
@property NSInteger seconds;
@property NSTimer *timer;

- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupGame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGame {
  self.seconds = 30;
  self.count = 0;

  self.timerLabel.text = [NSString stringWithFormat:@"Time: %li", self.seconds];
  self.scoreLabel.text = [NSString stringWithFormat:@"%li", self.count];

  self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                           target:self
                                         selector:@selector(subtractTime)
                                         userInfo:nil
                                          repeats:YES];
}

- (void)subtractTime {
  self.seconds--;
  self.timerLabel.text = [NSString stringWithFormat:@"Time: %li", self.seconds];

  if (self.seconds == 0) {
      [self.timer invalidate];
      
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Time is up!"
                                                                     message:[NSString stringWithFormat:@"You scored %li points", self.count]
                                                              preferredStyle:UIAlertControllerStyleAlert];
      
      UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Play Again!"
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action) {}];
      
      [alert addAction:defaultAction];
//      [self presentViewController:alert animated:YES completion:^([self setupGame])];
      [self presentViewController:alert animated:YES completion:^(void){[self setupGame];}];
  }
}

- (IBAction)buttonPressed:(id)sender {
  self.count ++;

  self.scoreLabel.text = [NSString stringWithFormat:@"%li", self.count];
}
@end
