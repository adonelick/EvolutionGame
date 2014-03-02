//
//  LSVMyScene.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/18/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "LSVMyScene.h"
#import "Character.h"
#import "Enemy.h"

#import "config.h"

@implementation LSVMyScene

- (id) initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        _projectiles = [NSMutableArray new];
        _enemies = [NSMutableArray new];
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        // Create the main character and place it in the center of the screen
        // Also, set it's current velocity to half of maximum
        mainCharacter = [[Character alloc] init];
        
        mainCharacter.position = CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMidY(self.frame));
        
        [self addChild:mainCharacter];
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    // Whenever a touch begins, reverse the direction of the moving
    // sprite across the screens
    for (UITouch *touch in touches) {
        // Do stuff here with touches...
    }
}

- (void) update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
    [self checkForCollisions];
    [self updateMainCharacter];
    [self updateProjectiles];
    [self updateEnemies];
}


- (void) checkForCollisions
{
    // Checks whether a collision has occured between any
    // of the creatures or objects currently in the scene.
}


- (void) updateMainCharacter
{
    SKAction *walkAction = [SKAction moveByX:mainCharacter.xVelocity*MAX_VELOCITY
                                           y:mainCharacter.yVelocity*MAX_VELOCITY
                                    duration:ACTION_DURATION];
    
    [mainCharacter runAction:walkAction];
}

- (void) updateProjectiles
{
    SKAction* shootAction;
    NSMutableArray* vanishedProjectiles = [NSMutableArray new];
    
    // Update the position of all the remaining projectiles
    for (Projectile* p in _projectiles) {
        
        if (p.isTravelingRight) {
            shootAction = [SKAction moveByX:0.2*MAX_VELOCITY
                                          y:0.0*MAX_VELOCITY
                                   duration:ACTION_DURATION];
        } else {
            shootAction = [SKAction moveByX:-0.2*MAX_VELOCITY
                                          y:0.0*MAX_VELOCITY
                                   duration:ACTION_DURATION];
        }
        [p runAction:shootAction];
        
        // Check if the projectile has gone out of bounds. If so,
        // slate it for deletion.
        if (p.position.x > self.frame.size.width || p.position.x < 0) {
            [vanishedProjectiles addObject:p];
        }
    }
    
    // Delete the projectiles that have gone out of bounds
    for (Projectile* p in vanishedProjectiles) {
        [_projectiles removeObject:p];
    }

}

- (void) updateEnemies
{
    // Update enemies here...
}


- (void) addProjectile:(Projectile*) projectile
{
    // A projectile can only be added if it is not nil.
    // If it is, do nothing.
    if (projectile) {
        CGFloat x = mainCharacter.position.x;
        CGFloat y = mainCharacter.position.y;
        
        // Adjust the projectile's start position to make it come out
        // of the weapon on the image
        projectile.position = CGPointMake(x + PROJECTILE_DX, y + PROJECTILE_DY);
        
        projectile.position = CGPointMake(x + PROJECTILE_DX, y + PROJECTILE_DY);
        [_projectiles addObject:projectile];
        [self addChild:projectile];
    }
}

@end
