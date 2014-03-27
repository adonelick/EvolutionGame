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
        
        _textureTimer = [NSTimer scheduledTimerWithTimeInterval:UPDATE_TIME
                                                         target:self
                                                       selector:@selector(updateTextures)
                                                       userInfo:nil
                                                        repeats:YES];
        _projectiles = [NSMutableArray new];
        _enemyProjectiles = [NSMutableArray new];
        _enemies = [NSMutableArray new];
        
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


- (void) updateTextures
{
    [mainCharacter updateTexture];
    
    for (Enemy* e in _enemies) {
        [e updateTexture];
    }
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
    [self mainCharacterGravity];
}


- (void) checkForCollisions
{
    // Checks whether a collision has occured between any
    // of the creatures or objects currently in the scene.
    
    NSMutableArray* killedEnemies = [NSMutableArray new];
    NSMutableArray* usedProjectiles = [NSMutableArray new];
    
    // Calculates the relative position between all projectiles
    // fired by the character and the enemies
    for (Projectile* p in _projectiles) {
        for (Enemy* e in _enemies) {
            CGPoint projectPos = p.position;
            CGPoint enemyPos = e.position;
            double distance = [ExtraMath distanceBetween:projectPos and: enemyPos];
            
            if (distance <= KILL_DISTANCE) {
                
                [e damageBy:1];
                [usedProjectiles  addObject:p];
                
                // Delete the enemy and projectile from the scene
                // if enough damage has occured to kill the enemy
                if (e.health <= 0) {
                    [killedEnemies addObject:e];
                }
            }
        }
    }
    
    [self cleanUp:_enemies byDeleting: killedEnemies];
    [self cleanUp:_projectiles byDeleting: usedProjectiles];
}


- (void) updateMainCharacter
{
    [mainCharacter move];
}

- (void) updateProjectiles
{
    NSMutableArray* vanishedProjectiles = [NSMutableArray new];
    
    // Update the position of all the remaining projectiles
    for (Projectile* p in _projectiles) {
        [p move];
        
        // Check if the projectile has gone out of bounds. If so,
        // slate it for deletion.
        if (p.position.x > self.frame.size.width || p.position.x < 0) {
            [vanishedProjectiles addObject:p];
        }
    }
    
    // Delete the projectiles that have gone out of bounds
    [self cleanUp:_projectiles byDeleting:vanishedProjectiles];
    [vanishedProjectiles removeAllObjects];
    
    for (Projectile* p in _enemyProjectiles) {
        [p move];
        
        // Check if the projectile has gone out of bounds. If so,
        // slate it for deletion.
        if (p.position.x > self.frame.size.width || p.position.x < 0) {
            [vanishedProjectiles addObject:p];
        }
    }
    
    [self cleanUp:_enemyProjectiles byDeleting:vanishedProjectiles];

}

- (void) updateEnemies
{
    for (Enemy* e in _enemies) {
        [e move];
        [e circleAround:mainCharacter.position withDistance:100];
        [self addProjectile: [e fireProjectileAt:mainCharacter.position] toArray:_enemyProjectiles];
    }
}

- (void) mainCharacterGravity
{
    if (mainCharacter.position.y > CGRectGetMidY(self.frame)) {
        mainCharacter.yVelocity -= .05;
    }
    else if (mainCharacter.position.y < CGRectGetMidY(self.frame)) {
        mainCharacter.yVelocity = 0;
        mainCharacter.position = CGPointMake(mainCharacter.position.x,
                                             CGRectGetMidY((self.frame)));
        mainCharacter.airborne = NO;
        
    }
}



- (void) cleanUp:(NSMutableArray *)objects byDeleting:(NSMutableArray *)delObjects
{
    // Deletes a set of objects from another set of objects
    for (id itemToDelete in delObjects) {
        [itemToDelete removeFromParent];
        [objects removeObject:itemToDelete];
    }
}


- (void) addProjectile:(Projectile*) projectile toArray: (NSMutableArray*) array
{
    // A projectile can only be added if it is not nil.
    // If it is, do nothing.
    if (projectile) {
        
        [array addObject:projectile];
        [self addChild:projectile];
        
    }
}


@end
