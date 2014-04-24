//
//  Enemy.h
//  EvolutionaryGame
//
//  Created by CS121 on 3/1/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Creature.h"
#import "ExtraMath.h"
#import "config.h"



@interface Enemy : Creature

// Type of enemy
@property int type;

// Weapon property (type is different for each enemy)
@property Weapon* weapon;


- (id) fireProjectileAt: (CGPoint) point;

- (void) moveToward:(CGPoint) point;

// Makes the enemy circle around a certain point (only used for small enemies)
- (void) circleAround:(CGPoint)point withDistance:(int)distance;

// Makes the enemy wander left to right (only used for medium enemies)
- (void) moveLeftRight;

// Enemy has this behavior when the character is out of range
- (void) primaryMovement;

// Enemy has this behavior when the character is in range (distance is distance to character)
- (void) secondaryMovement:(CGPoint)point withDistance:(int)distance;

@end
