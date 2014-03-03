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
#import "ExtraMath.h"

#import "config.h"

@implementation LSVMyScene

- (id) initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        
        _projectiles = [NSMutableArray new];
        _enemies = [NSMutableArray new];
        _killedEnemies = [NSMutableArray new];
        _usedProjectiles = [NSMutableArray new];
        
        Enemy* newEnemy = [[Enemy alloc] init];
        newEnemy.position = CGPointMake(CGRectGetMidX(self.frame),
                                        CGRectGetMidY(self.frame));
        [_enemies addObject:newEnemy];
        [self addChild:newEnemy];
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        // Create the main character and place it in the center of the screen
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
    
    // Calculates the relative position between all projectiles
    // and enemies
    
    for (Projectile* p in _projectiles) {
        for (Enemy* e in _enemies) {
            CGPoint projectPos = p.position;
            CGPoint enemyPos = e.position;
            double distance = [ExtraMath distanceBetween:projectPos and: enemyPos];
            
            if (distance <= KILL_DISTANCE) {
                
                [e damageBy:1];
                [_usedProjectiles  addObject:p];
                
                if (e.health <= 0) {
                    // Delete the enemy and projectile from the scene
                    [_killedEnemies addObject:e];
                }
            }
        }
    }
    
    [self cleanUp:_enemies byDeleting:_killedEnemies];
    [self cleanUp:_projectiles byDeleting:_usedProjectiles];
    
}


- (void) updateMainCharacter
{
    SKAction* walkAction = [SKAction moveByX:mainCharacter.xVelocity*MAX_VELOCITY
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
    for (Enemy* e in _enemies) {
        [e updateTexture];
    }
}

- (void) cleanUp:(NSMutableArray *)objects byDeleting:(NSMutableArray *)delObjects
{
    // Deletes a set of objects from another set of objects
    for (id itemToDelete in delObjects) {
        [itemToDelete removeFromParent];
        [objects removeObject:itemToDelete];
    }
    
    delObjects = [NSMutableArray new];
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
        
        if (mainCharacter.facingRight) {
            projectile.position = CGPointMake(x + PROJECTILE_DX, y + PROJECTILE_DY);
        } else {
            projectile.position = CGPointMake(x - PROJECTILE_DX, y + PROJECTILE_DY);
        }
        
        [_projectiles addObject:projectile];
        [self addChild:projectile];
    }
}



@end
