//
//  Character.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/19/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Creature.h"
#import "Weapon.h"

@interface Character : Creature

// Determines whether or not the character is armed
@property Boolean isArmed;

// The weapon for the character
@property Weapon* weapon;

// Textures for the character walking with a weapon
@property SKTexture* walkLeftWeapon1;
@property SKTexture* walkLeftWeapon2;
@property SKTexture* walkRightWeapon1;
@property SKTexture* walkRightWeapon2;

// Makes the weapon fire a projectile.
// Returns the projectile fired.
- (id) fireProjectile;

@end
