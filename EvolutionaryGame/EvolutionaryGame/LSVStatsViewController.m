//
//  LSVStatsViewController.m
//  EvolutionaryGame
//
//  Created by Alix Joe on 4/29/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "LSVStatsViewController.h"
#import "LSVMyScene.h"
#import "config.h"
#import "LSVHealthView.h"

@interface LSVStatsViewController ()

@end

@implementation LSVStatsViewController

@synthesize strengthLabel;


/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController* statsDisplay = [storyboard instantiateViewControllerWithIdentifier:@"StatisticsDisplay"];
    
    strength = (200 * mainCharacter.stats.fireDef) - 100;
    [strengthLabel setText:[NSString stringWithFormat:@"%d/300", (int)strength]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
