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
    p.velocity = 0.3;
    p.damage = 100;
    
    // Set properties of the projectile here, based on
    // the current evolution of the weapon
    
    return p;
}

@end
