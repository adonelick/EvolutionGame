//
//  LSVMyScene.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/18/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "LSVMyScene.h"


// DELETE LATER: numbers:
// platform/hazard size: 50x50
// character size: use 58x74


@implementation LSVMyScene

CharacterStats *characterStats = nil;
WeaponStats *weaponstats = nil;

+ (void)initialize {
    if(!characterStats)
        characterStats = [[CharacterStats alloc] init];
    if(!weaponstats)
        weaponstats = [[WeaponStats alloc] init];
}




- (id) initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        
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
        _charStats = characterStats;
        _weaponStats = weaponstats;
        
        // Testing display
        Platform* exitTest = [[Platform alloc] init: @"Exit.png"];
        exitTest.position = CGPointMake(CGRectGetMidX(self.frame) + 250,
                                        CGRectGetMidY(self.frame) + 13);
        [self addChild:exitTest];
        
        // Create the main character and place it in the center of the screen
        mainCharacter = [[Character alloc] initWithEvolved:NO andStats:_charStats andWeaponStats:_weaponStats];
        mainCharacter.position = CGPointMake(CGRectGetMidX(self.frame),
                                             CGRectGetMidY(self.frame));
        [self addChild:mainCharacter];
        mainCharacter.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:CHARACTER_HALF_HEIGHT];
        mainCharacter.physicsBody.dynamic = YES;
        mainCharacter.physicsBody.affectedByGravity = YES;
        mainCharacter.physicsBody.linearDamping = 1;
        mainCharacter.physicsBody.angularDamping = 10000;
        mainCharacter.physicsBody.mass = 0.1;
        
        self.backgroundColor = [SKColor colorWithRed:0.25 green:0.15 blue:0.15 alpha:1.0];
        
        
        // FOR TESTING PURPOSES:
        
        _ground = mainCharacter.position.y - CHARACTER_HALF_HEIGHT;
        
        SmokeHazard* newHazard = [[SmokeHazard alloc] init];
        newHazard.position = CGPointMake(CGRectGetMidX(self.frame)+100,
                                         _ground + 25);
        [_smokeHazards addObject:newHazard];
        [self addChild:newHazard];
        
        SmokeHazard* newHazard2 = [[SmokeHazard alloc] init];
        newHazard2.position = CGPointMake(CGRectGetMidX(self.frame)+150,
                                         _ground + 25);
        [_smokeHazards addObject:newHazard2];
        [self addChild:newHazard2];
        
        SmokeHazard* newHazard3 = [[SmokeHazard alloc] init];
        newHazard3.position = CGPointMake(CGRectGetMidX(self.frame)+100,
                                         _ground + 75);
        [_smokeHazards addObject:newHazard3];
        [self addChild:newHazard3];
        
        SmokeHazard* newHazard4 = [[SmokeHazard alloc] init];
        newHazard4.position = CGPointMake(CGRectGetMidX(self.frame)+150,
                                         _ground + 75);
        [_smokeHazards addObject:newHazard4];
        [self addChild:newHazard4];
        
        Platform* testPlatform = [[Platform alloc] init: @"FirePlatformSinglePiece.gif"];
        testPlatform.position = CGPointMake(CGRectGetMidX(self.frame),
                                            CGRectGetMidY(self.frame)+(25+50*1));
        [_platforms addObject:testPlatform];
        [self addChild:testPlatform];
        
        Platform* testPlatform2 = [[Platform alloc] init: @"FirePlatformTopLeftBottom.gif"];
        testPlatform2.position = CGPointMake(CGRectGetMidX(self.frame) + (50*-2),
                                            CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform2];
        [self addChild:testPlatform2];
        
        Platform* testPlatform3 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform3.position = CGPointMake(CGRectGetMidX(self.frame) + (50*-1),
                                            CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform3];
        [self addChild:testPlatform3];
        
        Platform* testPlatform4 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform4.position = CGPointMake(CGRectGetMidX(self.frame) + (50*+2),
                                            CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform4];
        [self addChild:testPlatform4];
        
        Platform* testPlatform5 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform5.position = CGPointMake(CGRectGetMidX(self.frame) + (50*+1),
                                            CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform5];
        [self addChild:testPlatform5];
        
        Platform* testPlatform6 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform6.position = CGPointMake(CGRectGetMidX(self.frame),
                                             CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform6];
        [self addChild:testPlatform6];
        
        Platform* testPlatform7 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform7.position = CGPointMake(CGRectGetMidX(self.frame) + (50*+3),
                                             CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform7];
        [self addChild:testPlatform7];
        
        Platform* testPlatform8 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform8.position = CGPointMake(CGRectGetMidX(self.frame) + (50*+4),
                                             CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform8];
        [self addChild:testPlatform8];
        
        Platform* testPlatform9 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform9.position = CGPointMake(CGRectGetMidX(self.frame) + (50*+5),
                                             CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform9];
        [self addChild:testPlatform9];
        
        Platform* testPlatform10 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform10.position = CGPointMake(CGRectGetMidX(self.frame) + (50*+6),
                                             CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform10];
        [self addChild:testPlatform10];
        
        Platform* testPlatform11 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform11.position = CGPointMake(CGRectGetMidX(self.frame) + (50*+7),
                                             CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform11];
        [self addChild:testPlatform11];
        
        Platform* testPlatform12 = [[Platform alloc] init: @"FirePlatformTopLeftBottom.gif"];
        testPlatform12.position = CGPointMake(CGRectGetMidX(self.frame) + (50*-7),
                                              CGRectGetMidY(self.frame) - 112);
        [_platforms addObject:testPlatform12];
        [self addChild:testPlatform12];
        
        Platform* testPlatform13 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform13.position = CGPointMake(CGRectGetMidX(self.frame) + (50*-6),
                                              CGRectGetMidY(self.frame) - 112);
        [_platforms addObject:testPlatform13];
        [self addChild:testPlatform13];
        
        Platform* testPlatform14 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform14.position = CGPointMake(CGRectGetMidX(self.frame) + (50*-5),
                                              CGRectGetMidY(self.frame) - 112);
        [_platforms addObject:testPlatform14];
        [self addChild:testPlatform14];
        
        Platform* testPlatform15 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform15.position = CGPointMake(CGRectGetMidX(self.frame) + (50*-4),
                                              CGRectGetMidY(self.frame) - 112);
        [_platforms addObject:testPlatform15];
        [self addChild:testPlatform15];
        
        Platform* testPlatform16 = [[Platform alloc] init: @"FirePlatformTopRightBottom.gif"];
        testPlatform16.position = CGPointMake(CGRectGetMidX(self.frame) + (50*-3),
                                              CGRectGetMidY(self.frame) - 112);
        [_platforms addObject:testPlatform16];
        [self addChild:testPlatform16];
        
        Platform* testPlatform17 = [[Platform alloc] init: @"FirePlatformTopRightBottom.gif"];
        testPlatform17.position = CGPointMake(CGRectGetMidX(self.frame) + (50*-8),
                                              CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform17];
        [self addChild:testPlatform17];
        
        Platform* testPlatform18 = [[Platform alloc] init: @"FirePlatformTopBottom.gif"];
        testPlatform18.position = CGPointMake(CGRectGetMidX(self.frame) + (50*+8),
                                              CGRectGetMidY(self.frame) - 62);
        [_platforms addObject:testPlatform18];
        [self addChild:testPlatform18];
        

        
        
        for (Platform* p in _platforms) {
            p.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(50, 50)];
            p.physicsBody.dynamic = NO;
            p.physicsBody.affectedByGravity = NO;
            p.physicsBody.linearDamping = 1000;
        }
        
        
        SmallEnemy* newEnemy = [[SmallEnemy alloc] init];
        newEnemy.position = CGPointMake(CGRectGetMidX(self.frame),
                                        CGRectGetMidY(self.frame));
        [_enemies addObject:newEnemy];
        [self addChild:newEnemy];
        
        MediumEnemy* newEnemy1 = [[MediumEnemy alloc] init];
        newEnemy1.position = CGPointMake(CGRectGetMidX(self.frame) - 175,
                                         CGRectGetMidY(self.frame) - 50);
        
        
        [_enemies addObject:newEnemy1];
        [self addChild:newEnemy1];
        newEnemy1.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:MEDIUM_ENEMY_HALF_HEIGHT];
        newEnemy1.physicsBody.dynamic = YES;
        newEnemy1.physicsBody.affectedByGravity = YES;
        newEnemy1.physicsBody.linearDamping = 1;
        newEnemy1.physicsBody.angularDamping = 10000;
        newEnemy1.physicsBody.mass = 0.1;
        
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
    
    // Update the health bar
    _health.frame = CGRectMake(30,86,(mainCharacter.health)*(0.25),8);
    
    // Check if you can jump again
    if ((mainCharacter.physicsBody.velocity.dy == 0.0) || mainCharacter.physicsBody.velocity.dy == -0.0) {
        if (mainCharacter.movingDown) {
            mainCharacter.movingDown = NO;
            mainCharacter.airborne = NO;
        } else if (mainCharacter.movingUp) {
            mainCharacter.movingUp = NO;
            mainCharacter.movingDown = YES;
        }
    }

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
            if (mainCharacter.health - p.damage <= 0) {
                mainCharacter.health = 0;
                [usedProjectiles addObject:p];
            } else {
            [mainCharacter damageBy:(mainCharacter.stats.fireDef)*p.damage];
            [usedProjectiles addObject:p];
            }
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
        
        if ((-(TILE_HALF_SIZE + CHARACTER_HALF_WIDTH) <= xdist) && (xdist <= (TILE_HALF_SIZE + CHARACTER_HALF_WIDTH)) && (-(TILE_HALF_SIZE + CHARACTER_HALF_HEIGHT) <= ydist) && (ydist <= (TILE_HALF_SIZE + CHARACTER_HALF_HEIGHT)) && arc4random() < 150000000) {
            [mainCharacter damageBy:(mainCharacter.stats.breath)*h.damagePotential];
        }
    }

    
    for (Platform* p in _platforms) {
        for (Enemy* e in _enemies) {
            if (e.type == 2) {
                CGPoint enemyPos = e.position;
                CGPoint platformPos = p.position;
                int yDist = enemyPos.y - platformPos.y;
                int xDist = enemyPos.x - platformPos.x;
                if (abs(yDist) < (MEDIUM_ENEMY_HALF_HEIGHT + TILE_HALF_SIZE - 2)) {
                    if (xDist >= 0 && xDist <= (MEDIUM_ENEMY_HALF_WIDTH + TILE_HALF_SIZE)) {
                        e.facingRight = YES;
                    } else if (xDist <= 0 && (-1*xDist) <= (MEDIUM_ENEMY_HALF_WIDTH + TILE_HALF_SIZE)) {
                        e.facingRight = NO;
                    }
                }
            }
        }
    }
    
    
    // If enough damage has occured to kill the player,
    // end the game.
//    NSLog(@"%d", mainCharacter.health);
    if (mainCharacter.health <= 0) {
        // Show what stats screen here...
//        NSLog(@"You are now dead.");
    }
    
}


- (void) updateMainCharacter
{
    [mainCharacter move];
    
    // Because collisions can cause the character to rotate
    // about its center, we need to fight this rotation.
    SKAction* rotateAction = [SKAction rotateByAngle:-0.2*mainCharacter.zRotation duration:0.1];
    [mainCharacter runAction:rotateAction];
}

- (void) updateProjectiles
{
    NSMutableArray* vanishedProjectiles = [NSMutableArray new];
    
    // Update the position of all the remaining projectiles
    for (Projectile* p in _projectiles) {
        [p move];
        
        // Check if the projectile has gone out of bounds. If so,
        // slate it for deletion.
        if (p.position.x > self.frame.size.width - 20 || p.position.x < 20) {
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
        if (p.position.x > self.frame.size.width - 20 || p.position.x < 20) {
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
            Projectile* newProjectile = [e fireProjectileAt:mainCharacter.position];
            [self addProjectile: newProjectile toArray:_enemyProjectiles];
        }
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
//        projectile.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:10];
//        projectile.physicsBody.dynamic = YES;
//        projectile.physicsBody.allowsRotation = NO;
//        projectile.physicsBody.affectedByGravity = NO;
//        projectile.physicsBody.mass = 0.01;
        [array addObject:projectile];
        [self addChild:projectile];
        
    }
}


@end
