//
//  LSVCharacter.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/19/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Character : SKSpriteNode

// Values in range [-1, 1]
@property double xVelocity;
@property double yVelocity;

// Determines whether or not the character is armed
@property Boolean isArmed;

// Textures for the character's walking
@property SKTexture* walkLeft1;
@property SKTexture* walkLeft2;
@property SKTexture* walkRight1;
@property SKTexture* walkRight2;

// Textures for the character walking with a weapon
@property SKTexture* walkLeftWeapon1;
@property SKTexture* walkLeftWeapon2;
@property SKTexture* walkRightWeapon1;
@property SKTexture* walkRightWeapon2;

// Switches the texture of the character to display
// walking, arming with a weapon, etc
- (void) changeTexture;

- (void) fireProjectile;

@end
