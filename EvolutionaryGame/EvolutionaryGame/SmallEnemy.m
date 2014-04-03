//
//  SmallEnemy.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/30/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "SmallEnemy.h"

@implementation SmallEnemy

- (id) init
{
    self = [super initWithImageNamed:@"FireEnemySmallL1.gif"];
    
    if (self) {
        self.walkLeft1 = [SKTexture textureWithImageNamed:@"FireEnemySmallL1.gif"];
        self.walkLeft2 = [SKTexture textureWithImageNamed:@"FireEnemySmallL2.gif"];
        self.walkRight1 = [SKTexture textureWithImageNamed:@"FireEnemySmallR1.gif"];
        self.walkRight2 = [SKTexture textureWithImageNamed:@"FireEnemySmallR2.gif"];
        
        self.xVelocity = 0.0;
        self.yVelocity = 0.0;
        
        self.weapon = [[SmallEnemyWeapon alloc] init];
        
        self.health = 250;
        
        self.type = 1;
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




@end
