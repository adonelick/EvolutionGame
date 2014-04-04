//
//  LSVMyScene.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/18/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "LSVMyScene.h"
#import "Character.h"
#import "SmokeHazard.h"
#import "ExtraMath.h"
#import "SmallEnemy.h"
#import "Platform.h"

#import "config.h"

// DELETE LATER: numbers:
// platform/hazard size: 50x50
// character size: use 58x74


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
        _smokeHazards = [NSMutableArray new];
        _platforms = [NSMutableArray new];
        
        // Create the main character and place it in the center of the screen
        mainCharacter = [[Character alloc] init];
        mainCharacter.position = CGPointMake(CGRectGetMidX(self.frame),
                                             CGRectGetMidY(self.frame));
        [self addChild:mainCharacter];
        
        SmallEnemy* newEnemy = [[SmallEnemy alloc] init];
        newEnemy.position = CGPointMake(CGRectGetMidX(self.frame),
                                        CGRectGetMidY(self.frame));
        [_enemies addObject:newEnemy];
        [self addChild:newEnemy];
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        
        // FOR TESTING PURPOSES:
        SmokeHazard* newHazard = [[SmokeHazard alloc] init];
        newHazard.position = CGPointMake(CGRectGetMidX(self.frame)+100,
                                         CGRectGetMidY(self.frame));
        [_smokeHazards addObject:newHazard];
        [self addChild:newHazard];
        
        SmokeHazard* newHazard2 = [[SmokeHazard alloc] init];
        newHazard2.position = CGPointMake(CGRectGetMidX(self.frame)+150,
                                         CGRectGetMidY(self.frame));
        [_smokeHazards addObject:newHazard2];
        [self addChild:newHazard2];
        
        SmokeHazard* newHazard3 = [[SmokeHazard alloc] init];
        newHazard3.position = CGPointMake(CGRectGetMidX(self.frame)+100,
                                         CGRectGetMidY(self.frame)+50);
        [_smokeHazards addObject:newHazard3];
        [self addChild:newHazard3];
        
        SmokeHazard* newHazard4 = [[SmokeHazard alloc] init];
        newHazard4.position = CGPointMake(CGRectGetMidX(self.frame)+150,
                                         CGRectGetMidY(self.frame)+50);
        [_smokeHazards addObject:newHazard4];
        [self addChild:newHazard4];
        
        Platform* testPlatform = [[Platform alloc] init: @"FirePlatformSinglePiece.gif"];
        testPlatform.position = CGPointMake(CGRectGetMidX(self.frame),
                                            CGRectGetMidY(self.frame)+(25+50*1));
        [_platforms addObject:testPlatform];
        [self addChild:testPlatform];
        
        

    }
    return self;
}


- (void) updateTextures
{
    [mainCharacter updateTexture];
    
    for (Enemy* e in _enemies) {
        [e updateTexture];
    }
    
    for (SmokeHazard* h in _smokeHazards) {
        ++h.delay;
        if(h.delay == 7) {
            h.delay = 0;
            [h updateTexture];
        }
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
                
                [e damageBy:p.damage];
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
    
    // Calculates the relative position between all projectiles
    // fired by the enemies and the character.
    
    for (Projectile* p in _enemyProjectiles) {
        CGPoint projectPos = p.position;
        CGPoint characterPos = mainCharacter.position;
        double distance = [ExtraMath distanceBetween:projectPos and:characterPos];
        
        if (distance <= KILL_DISTANCE) {
            
            [mainCharacter damageBy:p.damage];
            [usedProjectiles addObject:p];
        }
        
    }
    
    [self cleanUp:_enemyProjectiles byDeleting:usedProjectiles];
    
    // Check whether the main character has come into contact with
    // any of the smoke hazards on the screen.
    for (SmokeHazard* h in _smokeHazards) {
        CGPoint hazardPos = h.position;
        CGPoint characterPos = mainCharacter.position;
        int xdist = hazardPos.x - characterPos.x;
        int ydist = hazardPos.y - characterPos.y;
        
        if ((-54 <= xdist) && (xdist <= 54) && (-62 <= ydist) && (ydist <= 62) && arc4random() < 150000000) {
            [mainCharacter damageBy:h.damagePotential];
        }
    }
    
    // If enough damage has occured to kill the player,
    // end the game.
    NSLog(@"%d", mainCharacter.health);
    if (mainCharacter.health <= 0) {
        // Show what stats screen here...
        NSLog(@"You are now dead.");
    }
    
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
        
            // Fire a projectile at random time intervals to try
            // to kill the main player.
            if (arc4random() < 50000000) {
                [self addProjectile: [e fireProjectileAt:mainCharacter.position] toArray:_enemyProjectiles];
        }
    }
}

- (void) mainCharacterGravity
{
    if (mainCharacter.position.y > CGRectGetMidY(self.frame)) {
        mainCharacter.yVelocity -= .04;
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
