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
        
        self.xVelocity = 0.0;
        self.yVelocity = 0.0;
        
        self.weapon = [[Weapon alloc] init];
        
        self.health = 5;
    }
    
    return self;
}

- (id) fireProjectileAt: (CGPoint) point
{
    
    // Calculate the amount of rotation necessary to aim at the point
    double x1 = point.x;
    double y1 = point.y;
    
    double x2 = self.position.x;
    double y2 = self.position.y;
    
    double theta = atan2(y1 - y2, x1 - x2);
    
    return [self.weapon fireProjectile:theta];
}

- (void) circleAround:(CGPoint)point
{
    // Circling code here...
}

- (void) moveToward:(CGPoint)point
{
    // Moving code here...
}

@end
