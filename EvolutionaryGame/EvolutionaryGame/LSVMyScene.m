//
//  LSVMyScene.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/18/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "LSVMyScene.h"


@implementation LSVMyScene

// Keep the stats in a global variable so that the character can be reinitialized with its stats intact
CharacterStats *characterStats = nil;
WeaponStats *weaponstats = nil;
int currentLevel = 0;

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
        _doors = [NSMutableArray new];
        _charStats = characterStats;
        _weaponStats = weaponstats;
        currentLevel = 0;
        
        self.backgroundColor = [SKColor colorWithRed:0.25 green:0.15 blue:0.15 alpha:1.0];
        
        // Testing level map loading
        [self loadMap:[NSString stringWithFormat:@"level%d", currentLevel]];
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
    [self checkForEvolution];
    
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

int textureTimer = 0;

- (void) updateTextures
{
    // Make all moving objects on the screen move
    
    [mainCharacter updateTexture];
    
    for (Enemy* e in _enemies) {
        [e updateTexture];
    }
    
//    for (Enemy* e in _enemies) {
//        if (e.type == 1){
//            textureTimer ++;
//            NSLog(@"%d", textureTimer);
//            if (textureTimer == 10) {
//                [e updateTexture];
//                textureTimer = 0;
//            }
//        } else {
//                [e updateTexture];
//        }
//        
//    }
    
    for (SmokeHazard* h in _smokeHazards) {
        ++h.delay;
        if(h.delay == 7) {
            h.delay = 0;
            [h updateTexture];
        }
    }
}

- (void) checkForCollisions
{
    // Checks whether a collision has occured between any
    // of the creatures or objects currently in the scene.
    NSMutableArray* killedEnemies = [NSMutableArray new];
    NSMutableArray* usedProjectiles = [NSMutableArray new];
    
    // Checks if any of the player's projectiles has hit any enemies
    for (Projectile* p in _projectiles) {
        for (Enemy* e in _enemies) {
            CGPoint projectPos = p.position;
            CGPoint enemyPos = e.position;
            double distance = [ExtraMath distanceBetween:projectPos and: enemyPos];
            
            if (distance <= KILL_DISTANCE) {
                
                // If hit, damage the enemy
                float damage = 350*(p.fireDamage*p.fireDamage) - 825*(p.fireDamage) + 500;
                [e damageBy:damage];
                [usedProjectiles  addObject:p];
                
                // Delete the enemy and projectile from the scene
                // if enough damage has occured to kill the enemy
                if (e.health <= 0) {
                    mainCharacter.weapon.stats.killCount += e.type;
                    if(mainCharacter.weapon.stats.fireDamage < MAX_STAT && mainCharacter.weapon.stats.waterDamage > MIN_STAT && mainCharacter.weapon.stats.lightningDamage > MIN_STAT){
                        if (e.type == 1) {
                            mainCharacter.weapon.stats.fireDamage += (255/500);
                            mainCharacter.weapon.stats.waterDamage -= (252/500);
                            mainCharacter.weapon.stats.lightningDamage -= (253/500);
                        } else {
                            mainCharacter.weapon.stats.fireDamage += (260/500);
                            mainCharacter.weapon.stats.waterDamage -= (254/500);
                            mainCharacter.weapon.stats.lightningDamage -= (256/500);
                        }
                        if (mainCharacter.weapon.stats.fireDamage > MAX_STAT) {
                            mainCharacter.weapon.stats.fireDamage = MAX_STAT;
                        }
                        if (mainCharacter.weapon.stats.waterDamage < MIN_STAT) {
                            mainCharacter.weapon.stats.waterDamage = MIN_STAT;
                        }
                        if (mainCharacter.weapon.stats.lightningDamage < MIN_STAT) {
                            mainCharacter.weapon.stats.lightningDamage = MIN_STAT;
                        }
                    }
                    [killedEnemies addObject:e];
                }
            }
        }
    }
    
    [self cleanUp:_enemies byDeleting: killedEnemies];
    [self cleanUp:_projectiles byDeleting: usedProjectiles];
    
    // Checks if any of the enemies' projectiles has hit the player
    for (Projectile* p in _enemyProjectiles) {
        CGPoint projectPos = p.position;
        CGPoint characterPos = mainCharacter.position;
        double distance = [ExtraMath distanceBetween:projectPos and:characterPos];
        
        if (distance <= KILL_DISTANCE) {
            if (mainCharacter.health - (1/mainCharacter.stats.fireDef)*p.damage <= 0) {
                mainCharacter.health = 0;
                [usedProjectiles addObject:p];
                // Apply stat boosts upon death
                if (mainCharacter.stats.jumpHeight <= 1.99 && mainCharacter.stats.breath <= 1.99 && mainCharacter.stats.strength <= 1.97 && mainCharacter.stats.runSpeed >= 1.01 && mainCharacter.stats.climb >= 1.01) {
                    ++mainCharacter.stats.jumpHeight;
                    ++mainCharacter.stats.breath;
                    mainCharacter.stats.strength += 0.03;
                    --mainCharacter.stats.runSpeed;
                    --mainCharacter.stats.climb;
                    mainCharacter.stats.boost += 3;
                }
            } else {
            [mainCharacter damageBy:(1/mainCharacter.stats.fireDef)*p.damage];
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
            [mainCharacter damageBy:(1/mainCharacter.stats.breath)*h.damagePotential];
            if (mainCharacter.health <= 0) {
                mainCharacter.health = 0;
                // Apply stat boosts upon death
                if (mainCharacter.stats.jumpHeight <= 1.99 && mainCharacter.stats.breath <= 1.99 && mainCharacter.stats.strength <= 1.98 && mainCharacter.stats.runSpeed >= 1.01 && mainCharacter.stats.climb >= 1.01) {
                    ++mainCharacter.stats.jumpHeight;
                    ++mainCharacter.stats.breath;
                    mainCharacter.stats.strength += 0.02;
                    --mainCharacter.stats.runSpeed;
                    --mainCharacter.stats.climb;
                    mainCharacter.stats.boost += 2;
                }
            }
        }
    }

    // Make the medium enemies turn around if it has hit a wall
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
    
    // If the player comes in contact with a medium enemy, damage the player
    for (Enemy* e in _enemies) {
        if (e.type == 2) {
            int distance = (int)[ExtraMath distanceBetween:e.position and:mainCharacter.position];
            if (abs(distance) <= (MEDIUM_ENEMY_HALF_HEIGHT + CHARACTER_HALF_HEIGHT)) {
                [mainCharacter damageBy:20];
                if (mainCharacter.health <= 0) {
                    mainCharacter.health = 0;
                    // Apply stat boosts upon death
                    if (mainCharacter.stats.jumpHeight <= 1.99 && mainCharacter.stats.breath <= 1.99 && mainCharacter.stats.strength <= 1.97 && mainCharacter.stats.runSpeed >= 1.01 && mainCharacter.stats.climb >= 1.01) {
                        ++mainCharacter.stats.jumpHeight;
                        ++mainCharacter.stats.breath;
                        mainCharacter.stats.strength += 0.03;
                        --mainCharacter.stats.runSpeed;
                        --mainCharacter.stats.climb;
                        mainCharacter.stats.boost += 2;
                    }
                }
            }
            
        }
    }
    
    for (Door* d in _doors) {
        int distance = (int)[ExtraMath distanceBetween:d.position and:mainCharacter.position];
        if (abs(distance) <= CHARACTER_HALF_WIDTH) {
            currentLevel++;
            currentLevel = currentLevel%2;
            [self clearScene];
            [self loadMap:[NSString stringWithFormat:@"level%d", currentLevel]];
        }
    }
    
    
    // If enough damage has occured to kill the player,
    // end the game.
    if (mainCharacter.health <= 0) {
        currentLevel = 0;
        [self clearScene];
        [self loadMap:[NSString stringWithFormat:@"level%d", currentLevel]];
    }
}

int IVtimer = 0;

- (void) updateMainCharacter
{
    [mainCharacter move];
    
    if (mainCharacter.position.x < CGRectGetMidX(self.frame) - 200) {
        [self shiftSceneX:(mainCharacter.position.x - CGRectGetMidX(self.frame) + 200)];
    } else if (mainCharacter.position.x > CGRectGetMidX(self.frame) + 200) {
        [self shiftSceneX:(mainCharacter.position.x - CGRectGetMidX(self.frame) - 200)];
    }
    
    if (mainCharacter.position.y < CGRectGetMidY(self.frame) - 100) {
        [self shiftSceneY:(mainCharacter.position.y - CGRectGetMidY(self.frame) + 100)];
    } else if (mainCharacter.position.y > CGRectGetMidY(self.frame) + 100) {
        [self shiftSceneY:(mainCharacter.position.y - CGRectGetMidY(self.frame) - 100)];
    }
    
    // Because collisions can cause the character to rotate
    // about its center, we need to fight this rotation.
    SKAction* rotateAction = [SKAction rotateByAngle:-0.2*mainCharacter.zRotation duration:0.1];
    [mainCharacter runAction:rotateAction];
    
    // If we have invulnerability on, we need to time it out and then turn it off
    if (mainCharacter.invulnerable == YES) {
        ++IVtimer;
        if (IVtimer == 100) {
            mainCharacter.invulnerable = NO;
            IVtimer = 0;
        }
    }
    
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
        int charDist = (int)[ExtraMath distanceBetween:e.position and:mainCharacter.position];
        if (charDist <= BEHAVIOR_DIST) {
            [e secondaryMovement:mainCharacter.position withDistance:charDist];
            if (e.type == 1 && arc4random() < 50000000) {
                Projectile* newProjectile = [e fireProjectileAt:mainCharacter.position];
                [self addProjectile: newProjectile toArray:_enemyProjectiles];
            } else if (e.type == 2 && arc4random() < 5000000) {
                Projectile* newProjectile = [e fireProjectileAt:mainCharacter.position];
                [self addProjectile: newProjectile toArray:_enemyProjectiles];
            }
        } else {
            [e primaryMovement];
        }
        
//        [e move];
//        [e circleAround:mainCharacter.position withDistance:100];
        
        // Large enemies will need to fix their rotation if they get bumped by the main character
        if (e.type == 2) {
            SKAction* rotateAction = [SKAction rotateByAngle:-0.2*e.zRotation duration:0.1];
            [e runAction:rotateAction];
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
        [array addObject:projectile];
        [self addChild:projectile];
        
    }
}

// Check if either the main character or the weapon has advanced enough to evolve
- (void) checkForEvolution
{
    if (mainCharacter.weapon.stats.killCount >= KILL_TO_EVOLVE) {
        mainCharacter.weapon.stats.evolved = YES;
    }
    
    if (mainCharacter.stats.boost >= BOOST_TO_EVOLVE) {
        mainCharacter.stats.evolved = YES;
    }
}

- (void) loadMap:(NSString*) mapName
{
    NSString* path = [[NSBundle mainBundle] pathForResource:mapName
                                                     ofType:@"map"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    int currentX = 25;
    int currentY = 725;
    
    int mainCharX = 0;
    int mainCharY = 0;
    
    for (int i = 0; i < content.length; i++) {
        char tile = [content characterAtIndex:i];
        
        if (tile == '0') {
            [self addPlatform:@"FirePlatformBottom.gif" atX:currentX atY:currentY];
        } else if (tile == '1') {
            [self addPlatform:@"FirePlatformLeft.gif" atX:currentX atY:currentY];
        } else if (tile == '2') {
            [self addPlatform:@"FirePlatformTop.gif" atX:currentX atY:currentY];
        } else if (tile == '3') {
            [self addPlatform:@"FirePlatformRight.gif" atX:currentX atY:currentY];
        } else if (tile == '4') {
            [self addPlatform:@"FirePlatformBottomLeft.gif" atX:currentX atY:currentY];
        } else if (tile == '5') {
            [self addPlatform:@"FirePlatformTopLeft.gif" atX:currentX atY:currentY];
        } else if (tile == '6') {
            [self addPlatform:@"FirePlatformTopRight.gif" atX:currentX atY:currentY];
        } else if (tile == '7') {
            [self addPlatform:@"FirePlatformBottomRight.gif" atX:currentX atY:currentY];
        } else if (tile == '8') {
            [self addPlatform:@"FirePlatformBottomLeftRight.gif" atX:currentX atY:currentY];
        } else if (tile == '9') {
            [self addPlatform:@"FirePlatformTopLeftBottom.gif" atX:currentX atY:currentY];
        } else if (tile == 'U') {
            [self addPlatform:@"FirePlatformTopRightLeft.gif" atX:currentX atY:currentY];
        } else if (tile == 'V') {
            [self addPlatform:@"FirePlatformTopRightBottom.gif" atX:currentX atY:currentY];
        } else if (tile == 'W') {
            [self addPlatform:@"FirePlatformLeftRight.gif" atX:currentX atY:currentY];
        } else if (tile == 'X') {
            [self addPlatform:@"FirePlatformTopBottom.gif" atX:currentX atY:currentY];
        } else if (tile == 'Y') {
            [self addPlatform:@"FirePlatformCenter.gif" atX:currentX atY:currentY];
        } else if (tile == 'Z') {
            [self addPlatform:@"FirePlatformSinglePiece.gif" atX:currentX atY:currentY];
        } else if (tile == 'P') {
            mainCharX = currentX;
            mainCharY = currentY;
        } else if (tile == 'E') {
            Door* e = [[Door alloc] init];
            e.position = CGPointMake(currentX + 25, currentY + 25);
            [self insertChild:e atIndex:0];
            [_doors addObject:e];
        } else if (tile == 'S') {
            SmokeHazard* newHazard = [[SmokeHazard alloc] init];
            newHazard.position = CGPointMake(currentX, currentY);
            [_smokeHazards addObject:newHazard];
            [self addChild:newHazard];
        } else if (tile == 'B') {
            SmallEnemy* newEnemy = [[SmallEnemy alloc] init];
            newEnemy.position = CGPointMake(currentX, currentY);
            [_enemies addObject:newEnemy];
            [self addChild:newEnemy];
            newEnemy.startingPos = newEnemy.position;
        } else if (tile == 'M') {
            MediumEnemy* m = [[MediumEnemy alloc] init];
            m.position = CGPointMake(currentX + 25, currentY + 25);
            [_enemies addObject:m];
            [self addChild:m];
            m.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:MEDIUM_ENEMY_HALF_HEIGHT];
            m.physicsBody.dynamic = YES;
            m.physicsBody.affectedByGravity = YES;
            m.physicsBody.linearDamping = 1;
            m.physicsBody.angularDamping = 10000;
            m.physicsBody.mass = 0.1;
        }
        
        currentX += 50;
        if (tile == '\n') {
            currentX = 25;
            currentY -= 50;
        }
    }
    
    // Initialize main character last so it always displays on top.
    mainCharacter = [[Character alloc] initWithStats:_charStats andWeaponStats:_weaponStats];
    mainCharacter.position = CGPointMake(mainCharX, mainCharY + 12);
    [self addChild:mainCharacter];
    mainCharacter.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:CHARACTER_HALF_HEIGHT];
    mainCharacter.physicsBody.dynamic = YES;
    mainCharacter.physicsBody.affectedByGravity = YES;
    mainCharacter.physicsBody.linearDamping = 1;
    mainCharacter.physicsBody.angularDamping = 10000;
    mainCharacter.physicsBody.mass = 0.1;
}

- (void) addPlatform:(NSString*) fileName atX:(int) x atY:(int) y
{
    Platform* p = [[Platform alloc] init: fileName];
    p.position = CGPointMake(x, y);
    p.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(50, 50)];
    p.physicsBody.dynamic = NO;
    p.physicsBody.affectedByGravity = NO;
    p.physicsBody.linearDamping = 1000;
    [self addChild:p];
    [_platforms addObject:p];
}

- (void) shiftSceneX:(int) x
{
    for (SKNode* o in [self children]) {
        o.position = CGPointMake(o.position.x-x, o.position.y);
    }
}

- (void) shiftSceneY:(int) y
{
    for (SKNode* o in [self children]) {
        o.position = CGPointMake(o.position.x, o.position.y - y);
    }
}

- (void) clearScene
{
    [self removeAllChildren];
    _projectiles = [NSMutableArray new];
    _enemyProjectiles = [NSMutableArray new];
    _enemies = [NSMutableArray new];
    _smokeHazards = [NSMutableArray new];
    _platforms = [NSMutableArray new];
    _doors = [NSMutableArray new];
}

@end
