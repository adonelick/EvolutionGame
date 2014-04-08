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
    mainCharacter.isArmed = !(mainCharacter.isArmed);
}

- (IBAction)shootWeapon:(id)sender
{
    [_scene addProjectile:[mainCharacter fireProjectile] toArray:_scene.projectiles];
}


- (IBAction)leftButtonDown:(id)sender
{
    mainCharacter.xVelocity = -0.5;
}


- (IBAction)leftButtonUp:(id)sender
{
    mainCharacter.xVelocity = 0.0;
}


- (IBAction)rightButtonDown:(id)sender
{
    mainCharacter.xVelocity = 0.5;
}


- (IBAction)rightButtonUp:(id)sender
{

    mainCharacter.xVelocity = 0.0;
}

- (IBAction)jump:(id)sender
{
    if (mainCharacter.airborne == NO) {
    mainCharacter.yVelocity = 0;
    mainCharacter.airborne = YES;
    }
    
    [mainCharacter.physicsBody applyImpulse:CGVectorMake(0, 50)];
}



@end
