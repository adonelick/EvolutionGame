//
//  MediumEnemy.m
//  EvolutionaryGame
//
//  Created by CS121 on 4/13/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "MediumEnemy.h"

@implementation MediumEnemy

- (id) init
{
    self = [super initWithImageNamed:@"FireEnemyMediumL1.gif"];
    
    if (self) {
        self.walkLeft1 = [SKTexture textureWithImageNamed:@"FireEnemyMediumL1.gif"];
        self.walkLeft2 = [SKTexture textureWithImageNamed:@"FireEnemyMediumL2.gif"];
        self.walkRight1 = [SKTexture textureWithImageNamed:@"FireEnemyMediumR1.gif"];
        self.walkRight2 = [SKTexture textureWithImageNamed:@"FireEnemyMediumR2.gif"];
        
        self.xVelocity = 0.0;
        self.yVelocity = 0.0;
        
        self.weapon = [[SmallEnemyWeapon alloc] init];
        
        self.health = 250;
        
        self.type = 1;
    }
    
    return self;
}


@end
