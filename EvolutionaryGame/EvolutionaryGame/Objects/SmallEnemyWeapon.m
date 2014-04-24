//
//  SmallEnemyWeapon.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/31/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "SmallEnemyWeapon.h"
#import "SmallEnemyProjectile.h"

@implementation SmallEnemyWeapon

- (id) fireProjectile:(double) heading
{
    // Create the projectile objects here
    SmallEnemyProjectile* p = [[SmallEnemyProjectile alloc] initWithDirection:heading];
    p.velocity = 0.4;
    p.damage = 100;
    
    return p;
}

@end
