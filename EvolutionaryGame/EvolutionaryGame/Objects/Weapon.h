//
//  Weapon.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/28/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Projectile.h"

@interface Weapon : SKSpriteNode

// Damage stats (for player)
@property int fireDamage;
@property int iceDamage;
@property int lightningDamage;
@property int earthDamage;
@property int waterDamage;


- (id) fireProjectile:(double) heading;

@end
