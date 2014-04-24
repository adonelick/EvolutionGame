//
//  SmallEnemy.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/30/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "SmallEnemy.h"

@implementation SmallEnemy

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
        
        self.weapon = [[SmallEnemyWeapon alloc] init];
        
        self.health = 250;
        
        self.type = 1;
        
        self.texture = self.walkLeft1;
    }
    
    return self;
}

- (void) updateTexture
{
    if (self.xVelocity > 0) {
        // If the velocity is positive, then we are moving to the right
        self.facingRight = YES;
        
        if (self.texture == self.walkRight1) {
            self.texture = self.walkRight2;
        } else {
            self.texture = self.walkRight1;
        }
        
    } else if (self.xVelocity < 0) {
        // If the velocity is negative, then we are moving to the left
        self.facingRight = NO;
        
        if (self.texture == self.walkLeft1) {
            self.texture = self.walkLeft2;
        } else {
            self.texture = self.walkLeft1;
        }
    } else {
        if (self.texture == self.walkRight1) {
            self.texture = self.walkRight2;
        }
        if (self.texture == self.walkRight2) {
            self.texture = self.walkRight1;
        }
        if (self.texture == self.walkLeft1) {
            self.texture = self.walkLeft2;
        }
        if (self.texture == self.walkLeft2) {
            self.texture = self.walkLeft1;
        }
    }
}

- (void) primaryMovement
{
    // TODO
}

- (void) secondaryMovement:(CGPoint)point withDistance:(int)distance
{
    [self circleAround:point withDistance:distance];
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




@end
