//
//  Enemy.h
//  EvolutionaryGame
//
//  Created by CS121 on 3/1/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Creature.h"

@interface Enemy : Creature

@property int circlingRadius;

- (id) fireProjectileAt: (CGPoint) point;

// Makes the enemy move in a circle around a specified point
- (void) circleAround:(CGPoint) point withDistance:(int) distance;

- (void) moveToward:(CGPoint) point;

@end
