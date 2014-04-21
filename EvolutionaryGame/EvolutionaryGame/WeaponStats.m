//
//  WeaponStats.m
//  EvolutionaryGame
//
//  Created by CS121 on 4/20/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "WeaponStats.h"

@implementation WeaponStats

- (id) init
{
    self = [super init];
    
    self.fireDamage = 50;
    self.iceDamage = 50;
    self.lightningDamage = 50;
    self.earthDamage = 50;
    self.waterDamage = 50;
    
    return self;
}


@end
