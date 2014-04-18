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

@end
