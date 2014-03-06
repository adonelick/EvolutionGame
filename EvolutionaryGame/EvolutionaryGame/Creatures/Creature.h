//
//  Creature.h
//  EvolutionaryGame
//
//  Created by CS121 on 3/1/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Weapon.h"

@interface Creature : SKSpriteNode

// Values in range [-1, 1]
@property double xVelocity;
@property double yVelocity;

// The weapon for the creature
@property Weapon* weapon;

// Number of hits it takes to kill the creature
@property int health;

// Stores which direction the creature is currently pointed
@property Boolean facingRight;

// Textures for the character's walking
@property SKTexture* walkLeft1;
@property SKTexture* walkLeft2;
@property SKTexture* walkRight1;
@property SKTexture* walkRight2;

// Moves the creature based upon its x and y velocities
- (void) move;

// Switches the texture of the character to display
// walking, arming with a weapon, etc
- (void) updateTexture;

// Makes the weapon fire a projectile.
// Returns the projectile fired.
- (id) fireProjectile;

// Reduces the health of the creature by the specified amount
- (void) damageBy:(int) damage;


@end
