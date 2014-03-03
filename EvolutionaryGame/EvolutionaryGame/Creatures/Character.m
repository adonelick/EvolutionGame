//
//  Character.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/19/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Character.h"

@implementation Character

- (id) init
{
    self = [super initWithImageNamed:@"PlayerCharR1.gif"];
    
    if (self) {
        // Create the textures from the image files
        self.walkLeft1 = [SKTexture textureWithImageNamed:@"PlayerCharL1.gif"];
        self.walkLeft2 = [SKTexture textureWithImageNamed:@"PlayerCharL2.gif"];
        self.walkRight1 = [SKTexture textureWithImageNamed:@"PlayerCharR1.gif"];
        self.walkRight2 = [SKTexture textureWithImageNamed:@"PlayerCharR2.gif"];
        
        _walkLeftWeapon1 = [SKTexture textureWithImageNamed:@"PlayerCharWeaponL1.gif"];
        _walkLeftWeapon2 = [SKTexture textureWithImageNamed:@"PlayerCharWeaponL2.gif"];
        _walkRightWeapon1 = [SKTexture textureWithImageNamed:@"PlayerCharWeaponR1.gif"];
        _walkRightWeapon2 = [SKTexture textureWithImageNamed:@"PlayerCharWeaponR2.gif"];
        
        // Originally, the character is not moving
        self.xVelocity = 0.0;
        self.yVelocity = 0.0;
        
        self.health = 100;
        
        self.facingRight = YES;
        
        _weapon = [[Weapon alloc] init];
    }
    
    return self;
}

- (void) updateTexture
{
    // Make changes to the Character's appearance here
    
    if (_isArmed) {
        // Show the character with a weapon
        if (self.xVelocity > 0) {
            // If the velocity is positive, then we are moving to the right
            self.facingRight = YES;
            
            if (self.texture == _walkRightWeapon1) {
                self.texture = _walkRightWeapon2;
            } else {
                self.texture = _walkRightWeapon1;
            }
            
        } else if (self.xVelocity < 0) {
            // If the velocity is negative, then we are moving to the left
            self.facingRight = NO;
            
            if (self.texture == _walkLeftWeapon1) {
                self.texture = _walkLeftWeapon2;
            } else {
                self.texture = _walkLeftWeapon1;
            }
        } else {
            // Reset the textures to default if not moving
            if (self.facingRight) {
                self.texture = _walkRightWeapon1;
            } else {
                self.texture = _walkLeftWeapon1;
            }
        }

    } else {
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
}

- (id) fireProjectile
{
    // Fire a projectile, but only if the character is armed
    if (_isArmed) {
        return [_weapon fireProjectile:self.facingRight];
    } else {
        return nil;
    }
}


@end
