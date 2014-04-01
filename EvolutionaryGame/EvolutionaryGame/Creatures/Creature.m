//
//  Creature.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/1/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Creature.h"
#import "config.h"

@implementation Creature

// We don't need to overload the constructor in this class,
// but every other subclass should overload to load in
// specific walking textures.


- (void) move
{
    SKAction* moveAction = [SKAction moveByX:_xVelocity*MAX_VELOCITY
                                           y:_yVelocity*MAX_VELOCITY
                                    duration:ACTION_DURATION];
    
    [self runAction:moveAction];
}

- (void) updateTexture
{
    if (self.xVelocity > 0) {
        // If the velocity is positive, then we are moving to the right
        _facingRight = YES;
        
        if (self.texture == _walkRight1) {
            self.texture = _walkRight2;
        } else {
            self.texture = _walkRight1;
        }
        
    } else if (self.xVelocity < 0) {
        // If the velocity is negative, then we are moving to the left
        _facingRight = NO;
        
        if (self.texture == _walkLeft1) {
            self.texture = _walkLeft2;
        } else {
            self.texture = _walkLeft1;
        }
    } else {
        // Reset the textures to default if not moving
        if (_facingRight) {
            self.texture = _walkRight1;
        } else {
            self.texture = _walkLeft1;
        }
    }
}

- (id) fireProjectile
{
    // Make sure to override this method in a subclass to actually
    // fire some kind of projectile
    return nil;
}

- (void) damageBy:(int)damage
{
    if(self.health > 0){
        self.health -= damage;
        if(self.health < 0){
            self.health = 0;
        }
    }
}

@end
