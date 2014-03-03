//
//  LSVMyScene.h
//  EvolutionaryGame
//

//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Projectile.h"

@interface LSVMyScene : SKScene

// Keeps track of all the projectiles currently on the screen
@property NSMutableArray* projectiles;

// Keeps track of all the enemies currently on the screen
@property NSMutableArray* enemies;

@property NSMutableArray* killedEnemies;

@property NSMutableArray* usedProjectiles;

- (void) checkForCollisions;
- (void) updateMainCharacter;
- (void) updateProjectiles;
- (void) updateEnemies;


- (void) cleanUp:(NSMutableArray*) objects byDeleting:(NSMutableArray*) delObjects;

// Allows for the addition of projectiles
- (void) addProjectile:(Projectile*) projectile;

@end
