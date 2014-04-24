//
//  LSVViewController.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/18/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "LSVViewController.h"
#import "LSVMyScene.h"
#import "config.h"
#import "LSVHealthView.h"



@implementation LSVViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    _scene = [LSVMyScene sceneWithSize:skView.bounds.size];
    _scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:_scene];
    
    // Add in the health bar
    LSVHealthView *health = [[LSVHealthView alloc] init];
    health.frame = CGRectMake(30,90.3,250,8);
    health.layer.anchorPoint = CGPointMake(.5,1.0);
    [self.view addSubview:health];
    
    UIImageView *healthbar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HealthBar.gif"]];
    healthbar.frame = CGRectMake(20,99,260,35);
    healthbar.layer.anchorPoint = CGPointMake(.5,1.0);
    [self.view addSubview:healthbar];
    
    _scene.health = health;
    
    UIBarButtonItem *pauseButton =[[UIBarButtonItem alloc] initWithTitle:@"Pause" style:UIBarButtonItemStylePlain target:self action:@selector(pauseButtonPressed:)];
    [self.navigationItem setRightBarButtonItem:pauseButton];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)armCharacter:(id)sender
{
    if (mainCharacter.isArmed) {
        [sender setTitle:@"Arm" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"Disarm" forState:UIControlStateNormal];
    }
    mainCharacter.isArmed = !(mainCharacter.isArmed);
}

- (IBAction)shootWeapon:(id)sender
{
    [_scene addProjectile:[mainCharacter fireProjectile] toArray:_scene.projectiles];
}

- (IBAction)leftButtonDown:(id)sender
{
    mainCharacter.xVelocity = (mainCharacter.stats.runSpeed)*-0.375;
}

- (IBAction)leftButtonUp:(id)sender
{
    mainCharacter.xVelocity = 0.0;
}

- (IBAction)rightButtonDown:(id)sender
{
    mainCharacter.xVelocity = (mainCharacter.stats.runSpeed)*0.375;
}

- (IBAction)rightButtonUp:(id)sender
{
    mainCharacter.xVelocity = 0.0;
}

- (IBAction)pauseButtonPressed:(id)sender
{
    LSVHealthView *this = [[LSVHealthView alloc] init];
    this.frame = CGRectMake(300,300,250,250);
    this.layer.anchorPoint = CGPointMake(1.0,1.0);
    if(!self.scene.view.paused) {
        NSLog(@"Game Paused");
        self.scene.view.paused = YES;
        self.navigationItem.rightBarButtonItem.title = @"Resume";
        [self.view addSubview:this];
    } else {
        NSLog(@"Game Resumed");
        self.scene.view.paused = NO;
        [this removeFromSuperview];
    }
}

- (IBAction)jump:(id)sender
{

    if((((int)(mainCharacter.position.y-CHARACTER_HALF_HEIGHT)) <= MAX_SCREEN_HEIGHT) && (mainCharacter.airborne == NO)) {
        mainCharacter.airborne = YES;
        mainCharacter.movingUp = YES;
        [mainCharacter.physicsBody applyImpulse:CGVectorMake(0, 77*(mainCharacter.stats.jumpHeight))];
    }
    
}



@end
