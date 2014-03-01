//
//  Projectile.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/28/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Projectile.h"

@implementation Projectile

- (id) initWithDirection:(Boolean) isTravelingRight
{
    if (isTravelingRight) {
        self = [super initWithImageNamed:@"PlayerProjectileRight.gif"];
    } else {
        self = [super initWithImageNamed:@"PlayerProjectileLeft.gif"];
    }
    
    if (self) {
        _isTravelingRight = isTravelingRight;
    }
    
    return self;
}

@end
