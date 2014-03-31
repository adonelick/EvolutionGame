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

// Keeps track of all the projectiles fired by enemies on the screen
@property NSMutableArray* enemyProjectiles;

// Keeps track of all the enemies currently on the screen
// TODO: make a new array for each type of enemies, as
//       some of the enemies function differently than others.
@property NSMutableArray* enemies;

// Keeps track of all the environmental hazards on the screen
// that may pose a risk to the main player.
@property NSMutableArray* smokeHazards;

// Updates the appearance of the main character, enemies
// This timer calls another function every so often, but not
// as fast as the frames are rendered. This makes the animations
// go slow enough to be noticable.
@property NSTimer* textureTimer;

// Each of the following methods are called before
// each of the frames are rendered
- (void) checkForCollisions;
- (void) updateMainCharacter;
- (void) updateProjectiles;
- (void) updateEnemies;
- (void) mainCharacterGravity;


- (void) cleanUp:(NSMutableArray*) objects byDeleting:(NSMutableArray*) delObjects;

// Allows for the addition of projectiles
- (void) addProjectile:(Projectile*) projectile toArray: (NSMutableArray*) array;

@end
