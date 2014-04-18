//
//  MediumEnemyWeapon.m
//  EvolutionaryGame
//
//  Created by CS121 on 4/17/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "MediumEnemyWeapon.h"

@implementation MediumEnemyWeapon

- (id) fireProjectile:(double) heading
{
    // Create the projectile objects here
    MediumEnemyProjectile* p = [[MediumEnemyProjectile alloc] initWithDirection:heading];
    p.velocity = 0.3;
    p.damage = 250;
    
    return p;
}

@end
