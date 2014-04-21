//
//  LSVMyScene.h
//  EvolutionaryGame
//

//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Projectile.h"
#import "Character.h"
#import "SmokeHazard.h"
#import "ExtraMath.h"
#import "SmallEnemy.h"
#import "Platform.h"
#import "MediumEnemy.h"
#import "LSVHealthView.h"
#import "CharacterStats.h"
#import "WeaponStats.h"
#import "config.h"


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

// Keeps track of all the platforms in the level
@property NSMutableArray* platforms;

// Keeps track of the character's stats
@property CharacterStats* charStats;

@property WeaponStats* weaponStats;

// The y position of the ground relative to the main character
@property int ground;

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

// Is updated depending on the main character's health
@property LSVHealthView* health;

// Determines whether the character has 'evolved' or not
@property Boolean evolved;


- (void) cleanUp:(NSMutableArray*) objects byDeleting:(NSMutableArray*) delObjects;

// Allows for the addition of projectiles
- (void) addProjectile:(Projectile*) projectile toArray: (NSMutableArray*) array;

@end
