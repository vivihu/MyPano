//
//  MainViewController.m
//  MyPano
//
//  Created by icreative-mini on 13-7-22.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CGRect rect = self.view.frame;
    
    viewUp = [[JAPanoView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height/2 - 8)];
    [viewUp setFrontImage:[UIImage imageNamed:@"TowerHousepano_f.jpg"] rightImage:[UIImage imageNamed:@"TowerHousepano_r.jpg"] backImage:[UIImage imageNamed:@"TowerHousepano_b.jpg"] leftImage:[UIImage imageNamed:@"TowerHousepano_l.jpg"] topImage:[UIImage imageNamed:@"TowerHousepano_u.jpg"] bottomImage:[UIImage imageNamed:@"Down_fixed.jpg"]];
    [self.view addSubview:viewUp];
    viewUp.clipsToBounds = YES;
    viewUp.userInteractionEnabled = NO;
    viewUp.delegate = self;
    
    viewDown = [[JAPanoView alloc] initWithFrame:CGRectMake(0, rect.size.height/2 + 8, rect.size.width, rect.size.height/2 - 8)];
    [viewDown setFrontImage:[UIImage imageNamed:@"TowerHousepano_f.jpg"] rightImage:[UIImage imageNamed:@"TowerHousepano_r.jpg"] backImage:[UIImage imageNamed:@"TowerHousepano_b.jpg"] leftImage:[UIImage imageNamed:@"TowerHousepano_l.jpg"] topImage:[UIImage imageNamed:@"TowerHousepano_u.jpg"] bottomImage:[UIImage imageNamed:@"Down_fixed.jpg"]];
    [self.view addSubview:viewDown];
    viewDown.clipsToBounds = YES;
    viewDown.userInteractionEnabled = NO;
    
    
    _panIt = [[UIPanGestureRecognizer alloc] init];
    [_panIt addTarget:self action:@selector(systemPan:)];
    [self.view addGestureRecognizer:_panIt];
//    [viewUp addGestureRecognizer:_panIt];
}

- (void)systemPan:(UIPanGestureRecognizer *)sender
{
    [viewUp didPan:sender];
    
}

- (void)panoViewDidPan:(JAPanoView *)panoView {
    [viewDown didPan:_panIt];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
