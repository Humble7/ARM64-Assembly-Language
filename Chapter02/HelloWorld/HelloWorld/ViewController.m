//
//  ViewController.m
//  HelloWorld
//
//  Created by ChenZhen on 19/5/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

extern void start(void);

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    start();
}


@end
