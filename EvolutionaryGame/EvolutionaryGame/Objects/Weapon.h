//
//  Weapon.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/28/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Projectile.h"
#import "WeaponStats.h"

@interface Weapon : SKSpriteNode

@property WeaponStats* stats;

- (id) fireProjectile:(double) heading;

@end
