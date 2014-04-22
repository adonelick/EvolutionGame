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
    Projectile *p = [[Projectile alloc] init];
    if (self.stats.evolved == NO) {
        p = [[Projectile alloc] initWithDirection:heading andImage:@"PlayerProjectileRight.gif"];
    } else {
        p = [[Projectile alloc] initWithDirection:heading andImage:@"PlayerProjectileWaterRight.gif"];
    }
    p.velocity = 0.3;
    p.damage = 50;
    
    p.fireDamage = self.stats.fireDamage;
    p.iceDamage = self.stats.iceDamage;
    p.lightningDamage = self.stats.lightningDamage;
    p.earthDamage = self.stats.earthDamage;
    p.waterDamage = self.stats.waterDamage;
    
    // Set properties of the projectile here, based on
    // the current evolution of the weapon
    
    return p;
}

@end
