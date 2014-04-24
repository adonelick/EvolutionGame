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

@property int fireDamage;
@property int iceDamage;
@property int lightningDamage;
@property int earthDamage;
@property int waterDamage;

@property int killCount;

@end
