//
//  Character.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/19/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Creature.h"

@interface Character : Creature

// Determines whether or not the character is armed
@property Boolean isArmed;

// Determines whether the character is in the air
@property Boolean airborne;

@property Boolean movingUp;

@property Boolean movingDown;

// The weapon for the character
@property Weapon* weapon;

// Defense stats
@property float fireDef;
@property float iceDef;
@property float lightningDef;
@property float earthDef;
@property float waterDef;

// Ability stats
@property float jumpHeight;
@property float strength;
@property float runSpeed;
@property float climb;
@property float breath;

// Textures for the character walking with a weapon
@property SKTexture* walkLeftWeapon1;
@property SKTexture* walkLeftWeapon2;
@property SKTexture* walkRightWeapon1;
@property SKTexture* walkRightWeapon2;


@end
