//
//  MediumEnemyProjectile.m
//  EvolutionaryGame
//
//  Created by CS121 on 4/17/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "MediumEnemyProjectile.h"
#import "config.h"

@implementation MediumEnemyProjectile

- (id) initWithDirection:(double) heading
{
    self = [super initWithImageNamed:@"MediumEnemyProjectile.gif"];
    
    if (self) {
        SKAction* rotate = [SKAction rotateByAngle:heading duration:0.0];
        [self runAction:rotate];
        self.heading = heading;
    }
    
    return self;
}

@end
