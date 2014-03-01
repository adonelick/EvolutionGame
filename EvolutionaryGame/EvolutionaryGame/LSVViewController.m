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
    SKScene * scene = [LSVMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
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


- (IBAction)leftButtonDown:(id)sender
{
    // Create the timer that will tell the character to move
    _leftTimer = [NSTimer scheduledTimerWithTimeInterval:UPDATE_TIME
                                                      target:self
                                                      selector:@selector(moveCharacterLeft)
                                                      userInfo:nil
                                                      repeats:YES];
}

- (void) moveCharacterLeft
{
    mainCharacter.xVelocity = -1.0;
}

- (IBAction)leftButtonUp:(id)sender
{
    // Invalidate the timer to stop its operation
    [_leftTimer invalidate];
}


- (IBAction)rightButtonDown:(id)sender
{
    // Create the timer that will tell the character to move
    _rightTimer = [NSTimer scheduledTimerWithTimeInterval:UPDATE_TIME
                                                      target:self
                                                    selector:@selector(moveCharacterRight)
                                                    userInfo:nil
                                                     repeats:YES];
}

- (void) moveCharacterRight
{
    mainCharacter.xVelocity = 1.0;
}

- (IBAction)rightButtonUp:(id)sender
{
    // Invalidate the timer to stop its operation
    [_rightTimer invalidate];
}



@end
