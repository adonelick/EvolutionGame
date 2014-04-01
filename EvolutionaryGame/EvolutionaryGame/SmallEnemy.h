//
//  SmallEnemy.h
//  EvolutionaryGame
//
//  Created by CS121 on 3/30/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Enemy.h"
#import "SmallEnemyWeapon.h"

@interface SmallEnemy : Enemy

@property int circlingRadius;

// The weapon for the enemy
@property SmallEnemyWeapon* weapon;

@end
