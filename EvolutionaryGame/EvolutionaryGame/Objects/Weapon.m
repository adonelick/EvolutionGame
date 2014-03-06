//
//  Weapon.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/28/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Weapon.h"

@implementation Weapon

- (id) fireProjectile:(double) heading
{
    // Create the projectile objects here
    Projectile* p = [[Projectile alloc] initWithDirection:heading];
    p.velocity = 0.3;
    
    // Set properties of the projectile here, based on
    // the current evolution of the weapon
    
    return p;
}

@end
