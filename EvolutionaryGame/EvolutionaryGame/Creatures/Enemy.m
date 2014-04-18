//
//  Enemy.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/1/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Enemy.h"



@implementation Enemy

- (id) fireProjectileAt: (CGPoint) point
{
    // Calculate the amount of rotation necessary to aim at the point
    double x1 = point.x;
    double y1 = point.y;
    
    double x2 = self.position.x;
    double y2 = self.position.y;
    
    double theta = atan2(y1 - y2, x1 - x2);
    
    Projectile* p = [self.weapon fireProjectile:theta];
//    if (self.type == 1) {
//        if (self.facingRight) {
//            p.position = self.position;
//        } else {
//            p.position = self.position;
//        }
//    } else {
//        if (self.facingRight) {
//            p.position = self.position;
//        } else {
//            p.position = self.position;
//        }
//    }
    p.position = self.position;
    return p;
}


- (void) moveToward:(CGPoint)point
{
    // Move's toward the given point, but does not actually
    // reach it.
    int dx = point.x - self.position.x;
    int dy = point.y - self.position.y;
    
    SKAction* moveAction = [SKAction moveByX:0.1*dx y:0.1*dy duration:0.1];
    [self runAction:moveAction];
}

- (void) circleAround:(CGPoint)point withDistance:(int)distance
{
    // Only implement for small enemies
}

- (void) move
{
    // Only implement for medium enemies
}



@end
