//
//  Projectile.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/28/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Projectile.h"
#import "config.h"

@implementation Projectile

- (id) initWithDirection:(double) heading
{
    self = [super initWithImageNamed:@"PlayerProjectileRight.gif"];
    
    if (self) {
        SKAction* rotate = [SKAction rotateByAngle:heading duration:0.0];
        [self runAction:rotate];
        _heading = heading;
        
        // The weapon sets the projectile's velocity
        _velocity = 0.0;
        
        self.damage = 0;
        
        self.fireDamage = 0;
        self.iceDamage = 0;
        self.lightningDamage = 0;
        self.earthDamage = 0;
        self.waterDamage = 0;
        
    }
    
    return self;
}

- (id) initWithDirection:(double) heading andImage:(NSString *)imageName
{
    self = [super initWithImageNamed:imageName];
    
    if (self) {
        SKAction* rotate = [SKAction rotateByAngle:heading duration:0.0];
        [self runAction:rotate];
        _heading = heading;
        
        // The weapon sets the projectile's velocity
        _velocity = 0.0;
        
        self.damage = 0;
        
        self.fireDamage = 0;
        self.iceDamage = 0;
        self.lightningDamage = 0;
        self.earthDamage = 0;
        self.waterDamage = 0;
        
    }
    
    return self;
}

- (void) move
{
    double deltaX = MAX_VELOCITY * _velocity * cos(_heading);
    double deltaY = MAX_VELOCITY * _velocity * sin(_heading);
    
    SKAction* moveAction = [SKAction moveByX:deltaX
                                           y:deltaY
                                    duration:ACTION_DURATION];
    [self runAction:moveAction];
}

@end
