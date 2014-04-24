//
//  Character.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/19/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Character.h"
#import "config.h"

@implementation Character

- (id) initWithStats:(CharacterStats*) charstats andWeaponStats:(WeaponStats *)weaponstats
{
    if (charstats.evolved) {
        self = [super initWithImageNamed:@"FullFirePlayerCharR1.gif"];
        
        if (self) {
            // Create the textures from the image files
            self.walkLeft1 = [SKTexture textureWithImageNamed:@"FullFirePlayerCharL1.gif"];
            self.walkLeft2 = [SKTexture textureWithImageNamed:@"FullFirePlayerCharL2.gif"];
            self.walkRight1 = [SKTexture textureWithImageNamed:@"FullFirePlayerCharR1.gif"];
            self.walkRight2 = [SKTexture textureWithImageNamed:@"FullFirePlayerCharR2.gif"];
            
            _walkLeftWeapon1 = [SKTexture textureWithImageNamed:@"FullFirePlayerCharWeaponL1.gif"];
            _walkLeftWeapon2 = [SKTexture textureWithImageNamed:@"FullFirePlayerCharWeaponL2.gif"];
            _walkRightWeapon1 = [SKTexture textureWithImageNamed:@"FullFirePlayerCharWeaponR1.gif"];
            _walkRightWeapon2 = [SKTexture textureWithImageNamed:@"FullFirePlayerCharWeaponR2.gif"];
            
            _invisible = [SKTexture textureWithImageNamed:@"invisible.gif"];
            
            // Initialize everything
            self.health = 1000;

            self.stats = charstats;
            
            self.facingRight = YES;
            self.airborne = NO;
            self.movingUp = NO;
            self.movingDown = NO;
            self.invulnerable = NO;
            
            self.show = 0;
            
            self.weapon = [[Weapon alloc] init];
            
            self.weapon.stats = weaponstats;

        }
        
    } else {
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
            
            _invisible = [SKTexture textureWithImageNamed:@"invisible.gif"];
            
            // Initialize everything
            self.health = 1000;
            
            self.stats = charstats;
            
            self.facingRight = YES;
            self.airborne = NO;
            self.movingUp = NO;
            self.movingDown = NO;
            self.invulnerable = NO;
            
            self.show = 0;
        
            self.weapon = [[Weapon alloc] init];
        
            self.weapon.stats = weaponstats;
            
        }
        
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
    
    if (self.invulnerable) {
        ++self.show;
        if (self.texture != self.invisible) {
            self.pastTexture = self.texture;
        }
        if (self.show == 7) {
            self.show = 0;
            if (self.texture != self.invisible) {
                self.texture = self.invisible;
            } else {
                self.texture = self.pastTexture;
            }
        }
    }
    
}

- (id) fireProjectile
{
    Projectile* projectile = nil;
    // Fire a projectile, but only if the character is armed
    if (_isArmed) {
        double heading;
        if (self.facingRight) {
            heading = 0.0;
        } else {
            heading = M_PI;
        }
        projectile = [self.weapon fireProjectile:heading];
        
        CGFloat x = self.position.x;
        CGFloat y = self.position.y;
        
        // Adjust the projectile's start position to make it come out
        // of the weapon on the image
        
        if (self.facingRight) {
            projectile.position = CGPointMake(x + PROJECTILE_DX, y + PROJECTILE_DY);
        } else {
            projectile.position = CGPointMake(x - PROJECTILE_DX, y + PROJECTILE_DY);
        }
    }
    
    return projectile;
}

- (void) damageBy:(int)damage
{
    if (self.invulnerable == NO) {
        if(self.health > 0){
            self.health -= damage;
            if(self.health <= 0){
                self.health = 0;
            }
        }
        self.invulnerable = YES;
    }
}


@end
