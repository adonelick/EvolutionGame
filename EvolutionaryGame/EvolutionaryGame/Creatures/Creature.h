//
//  Creature.h
//  EvolutionaryGame
//
//  Created by CS121 on 3/1/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Creature : SKSpriteNode

// Values in range [-1, 1]
@property double xVelocity;
@property double yVelocity;

// Stores which direction the creature is currently pointed
@property Boolean facingRight;

// Textures for the character's walking
@property SKTexture* walkLeft1;
@property SKTexture* walkLeft2;
@property SKTexture* walkRight1;
@property SKTexture* walkRight2;

// Switches the texture of the character to display
// walking, arming with a weapon, etc
- (void) updateTexture;


@end
