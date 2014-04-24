//
//  MediumEnemy.m
//  EvolutionaryGame
//
//  Created by CS121 on 4/13/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "MediumEnemy.h"

@implementation MediumEnemy

- (id) init
{
    self = [super initWithImageNamed:@"FireEnemyMediumL1.gif"];
    
    if (self) {
        self.walkLeft1 = [SKTexture textureWithImageNamed:@"FireEnemyMediumL1.gif"];
        self.walkLeft2 = [SKTexture textureWithImageNamed:@"FireEnemyMediumL2.gif"];
        self.walkRight1 = [SKTexture textureWithImageNamed:@"FireEnemyMediumR1.gif"];
        self.walkRight2 = [SKTexture textureWithImageNamed:@"FireEnemyMediumR2.gif"];
        
        self.xVelocity = 0.0;
        self.yVelocity = 0.0;
        
        self.weapon = [[MediumEnemyWeapon alloc] init];
        
        self.health = 500;
        
        self.type = 2;
        
        self.facingRight = YES;
    }
    
    return self;
}


- (void) updateTexture
{
    if (self.xVelocity > 0) {
        // If the velocity is positive, then we are moving to the right
        self.facingRight = YES;
        
        if (self.texture == self.walkRight1) {
            self.texture = self.walkRight2;
        } else {
            self.texture = self.walkRight1;
        }
        
    } else if (self.xVelocity < 0) {
        // If the velocity is negative, then we are moving to the left
        self.facingRight = NO;
        
        if (self.texture == self.walkLeft1) {
            self.texture = self.walkLeft2;
        } else {
            self.texture = self.walkLeft1;
        }
    } else {
        // Reset the textures to default if not moving
        if (self.facingRight) {
            self.texture = self.walkRight1;
        } else {
            self.texture = self.walkLeft1;
        }
    }
}

- (void) primaryMovement
{
    [self moveLeftRight];
}

- (void) secondaryMovement:(CGPoint)point withDistance:(int)distance
{
    // TODO
}

- (void) moveLeftRight
{
    if (self.facingRight) {
        self.xVelocity = 1.5;
    } else {
        self.xVelocity = -1.5;
    }
    SKAction *moveAction = [SKAction moveByX:self.xVelocity y:0 duration:0.9];
    [self runAction:moveAction];
}

@end
