//
//  SmokeHazard.h
//  EvolutionaryGame
//
//  Created by CS121 on 3/30/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SmokeHazard : SKSpriteNode

// The amount of damage caused by a specific type of smoke
@property int damagePotential;

// Two different textures for the smoke's animation
@property SKTexture* texture1;
@property SKTexture* texture2;

// Variable for time delay to control flicker speed
@property int delay;

// Changes the texture of the smoke to show the animation
- (void) updateTexture;


@end
