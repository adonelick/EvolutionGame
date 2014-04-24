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
    
    self.evolved = NO;
    
    self.fireDamage = 1.5;
    self.iceDamage = 1.5;
    self.lightningDamage = 1.5;
    self.earthDamage = 1.5;
    self.waterDamage = 1.5;
    
    self.killCount = 0;
    
    return self;
}


@end
