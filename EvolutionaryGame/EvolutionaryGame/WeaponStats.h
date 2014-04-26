//
//  WeaponStats.h
//  EvolutionaryGame
//
//  Created by CS121 on 4/20/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeaponStats : NSObject

@property Boolean evolved;

@property float fireDamage;
@property float iceDamage;
@property float lightningDamage;
@property float earthDamage;
@property float waterDamage;

@property int killCount;

@end
