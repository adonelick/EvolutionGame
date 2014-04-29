//
//  Character.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/19/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Creature.h"
#import "CharacterStats.h"

@interface Character : Creature

// Determines whether or not the character is armed
@property Boolean isArmed;

// Determines whether the character is in the air
@property Boolean airborne;
@property Boolean movingUp;
@property Boolean movingDown;

// Check for if character has already died
@property Boolean dead;

// Determines whether the character can take damage
@property Boolean invulnerable;

// Used to make the image of the player character flash when invulnerable
@property int show;
@property SKTexture* pastTexture;

// The weapon for the character
@property Weapon* weapon;

// Character's stats
@property CharacterStats* stats;

// Textures for the character walking with a weapon
@property SKTexture* walkLeftWeapon1;
@property SKTexture* walkLeftWeapon2;
@property SKTexture* walkRightWeapon1;
@property SKTexture* walkRightWeapon2;

// Texture for the character while flashing on and off the screen
@property SKTexture* invisible;

// Initialization function that depends on whether or not the player has evolved
-(id) initWithStats:(CharacterStats*) charstats andWeaponStats:(WeaponStats*) weaponstats;

@end
