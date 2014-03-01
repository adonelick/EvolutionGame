//
//  Weapon.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/28/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Weapon.h"

@implementation Weapon

- (id) fireProjectile:(Boolean) fireRight
{
    // Create the projectile objects here
    Projectile* p = [[Projectile alloc] initWithDirection:fireRight];
    
    // Start the projectile moving at the specified
    // height above the main platform
    
    return p;
}

@end
