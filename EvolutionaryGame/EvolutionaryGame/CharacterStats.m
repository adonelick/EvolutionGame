//
//  CharacterStats.m
//  EvolutionaryGame
//
//  Created by CS121 on 4/20/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "CharacterStats.h"

@implementation CharacterStats

- (id) init
{
    self = [super init];
    
    self.evolved = NO;

    self.fireDef = 1.5;
    self.iceDef = 1.5;
    self.lightningDef = 1.5;
    self.earthDef = 1.5;
    self.waterDef = 1.5;

    self.jumpHeight = 1.5;
    self.strength = 1.5;
    self.runSpeed = 1.5;
    self.climb = 1.5;
    self.breath = 1.5;
    
    self.boost = 0;
    
    return self;
}


@end
