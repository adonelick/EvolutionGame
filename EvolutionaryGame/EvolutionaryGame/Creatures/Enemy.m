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
    SKAction* moveAction;
    CGPoint newPoint;
    int currentDist = (int)[ExtraMath distanceBetween:self.position and:point];
    
    if (!(abs(currentDist - distance) < 10)) {
        // The enemy currently is not on the circle around the
        // given point, so move to the start position
        
        double theta = atan2(self.position.x - point.x, self.position.y - point.y);
        
        newPoint = CGPointMake(point.x + (distance - 10) * cos(theta),
                               point.y + (distance - 10) * sin(theta));
        
        int dx = newPoint.x - self.position.x;
        int dy = newPoint.y - self.position.y;
        
        double speedX = 0.04;
        double speedY = 0.04;
        
        self.xVelocity = speedX*dx;
        self.yVelocity = speedY*dy;
        
        moveAction = [SKAction moveByX:speedX*dx y:speedY*dy duration:0.1];
    } else {
        // Continue circling the point
        CGPoint tempPosition = CGPointMake(self.position.x - point.x, self.position.y - point.y);
        
        CGAffineTransform rotate = CGAffineTransformMakeRotation(DELTA_THETA);
        
        double theta = atan2(-(self.position.x - point.x), self.position.y - point.y);
        self.xVelocity = cos(theta);
        self.yVelocity = sin(theta);
        
        newPoint = CGPointApplyAffineTransform(tempPosition, rotate);
        newPoint = CGPointMake(newPoint.x + point.x, newPoint.y + point.y);
        moveAction = [SKAction moveTo:newPoint duration:0.05];
    }
    
    
    [self runAction:moveAction];
}

- (void) move
{
    // Do nothing for an enemy
}



@end
