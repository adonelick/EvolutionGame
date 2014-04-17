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
    p.damage = 50;
    
    p.fireDamage = self.fireDamage;
    p.iceDamage = self.iceDamage;
    p.lightningDamage = self.lightningDamage;
    p.earthDamage = self.earthDamage;
    p.waterDamage = self.waterDamage;
    
    
    // Set properties of the projectile here, based on
    // the current evolution of the weapon
    
    return p;
}

@end
