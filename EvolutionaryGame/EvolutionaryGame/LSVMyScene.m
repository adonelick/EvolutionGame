//
//  LSVMyScene.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/18/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "LSVMyScene.h"
#import "LSVCharacter.h"

#import "config.h"

@implementation LSVMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
        // Create the main character and place it in the center of the screen
        // Also, set it's current velocity to half of maximum
        mainCharacter = [LSVCharacter spriteNodeWithImageNamed:@"Spaceship"];
        mainCharacter.position = CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMidY(self.frame));
        mainCharacter.xVelocity = 0.5;
        
        [self addChild:mainCharacter];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    // Whenever a touch begins, reverse the direction of the moving
    // sprite across the screens
    for (UITouch *touch in touches) {
    
        // Do stuff here with touches...
    
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    
    
    SKAction *action = [SKAction moveByX:mainCharacter.xVelocity*MAX_VELOCITY
                                       y:mainCharacter.yVelocity*MAX_VELOCITY
                                       duration:0.5];
    
    [mainCharacter runAction:action];
    mainCharacter.xVelocity = 0.0;
}

@end
