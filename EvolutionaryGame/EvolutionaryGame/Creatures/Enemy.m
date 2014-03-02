//
//  Enemy.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/1/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (id) init
{
    self = [super initWithImageNamed:@"FireEnemySmallL1.gif"];
    
    if (self) {
        self.walkLeft1 = [SKTexture textureWithImageNamed:@"FireEnemySmallL1.gif"];
        self.walkLeft2 = [SKTexture textureWithImageNamed:@"FireEnemySmallL2.gif"];
        self.walkRight1 = [SKTexture textureWithImageNamed:@"FireEnemySmallR1.gif"];
        self.walkRight2 = [SKTexture textureWithImageNamed:@"FireEnemySmallR2.gif"];
    }
    
    return self;
}

@end
