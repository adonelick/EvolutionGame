//
//  SmallEnemyProjectile.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/31/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "SmallEnemyProjectile.h"
#import "config.h"

@implementation SmallEnemyProjectile

- (id) initWithDirection:(double) heading
{
    self = [super initWithImageNamed:@"FireEnemySmallProjectileR.gif"];
    
    if (self) {
        SKAction* rotate = [SKAction rotateByAngle:heading duration:0.0];
        [self runAction:rotate];
        self.heading = heading;
    }
    
    return self;
}


@end
