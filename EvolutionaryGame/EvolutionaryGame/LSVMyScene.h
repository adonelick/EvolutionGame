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

- (void) checkForCollisions;
- (void) updateMainCharacter;
- (void) updateProjectiles;
- (void) updateEnemies;
- (void) mainCharacterGravity;

// Allows for the addition of projectiles
- (void) addProjectile:(Projectile*) projectile;

@end
