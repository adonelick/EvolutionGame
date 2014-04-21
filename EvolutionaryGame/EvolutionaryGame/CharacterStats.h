//
//  CharacterStats.h
//  EvolutionaryGame
//
//  Created by CS121 on 4/20/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CharacterStats : NSObject

// Defense stats
@property float fireDef;
@property float iceDef;
@property float lightningDef;
@property float earthDef;
@property float waterDef;

// Ability stats
@property float jumpHeight;
@property float strength;
@property float runSpeed;
@property float climb;
@property float breath;

@end
