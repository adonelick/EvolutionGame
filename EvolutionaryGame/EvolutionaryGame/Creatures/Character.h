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

// Textures for the character's walking
@property SKTexture* textureWalkLeft1;
@property SKTexture* textureWalkLeft2;
@property SKTexture* textureWalkRight1;
@property SKTexture* textureWalkRight2;

// Switches the texture of the character to display
// walking, arming with a weapon, etc
- (void) changeTexture;

@end
