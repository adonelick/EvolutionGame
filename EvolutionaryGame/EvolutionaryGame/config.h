//
//  config.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/22/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

/*
 Defines the constants needed to make the program run 
 effectively. Add constants that would otherwise be "magic
 numbers" to this file.
 */

#import "Character.h"

#ifndef CONFIG_H
#define CONFIG_H 1

#define ACTION_DURATION 0.2

#define MAX_VELOCITY 10.0
#define MIN_VELOCITY 0.0

#define PROJECTILE_DX 19
#define PROJECTILE_DY 9

// How close (in pixels) must a projectile come to a creature
// to cause damage?
#define KILL_DISTANCE 50

// How close (in pixels) must the main character come to
// the smoke hazard to be injured?
#define SMOKE_INJURE_DISTANCE 5

#define UPDATE_TIME 0.08

// How many enemies can be on the scene at one time
#define MAX_ENEMIES 5

// Amount of rotation (in radians) for the enemy's hover

#define DELTA_THETA 0.1


#define CHARACTER_HEIGHT 74

#define CHARACTER_HALF_HEIGHT 37

#define CHARACTER_WIDTH 58

#define CHARACTER_HALF_WIDTH 29

#define TILE_HALF_SIZE 25

#define MEDIUM_ENEMY_HALF_WIDTH 46

#define MEDIUM_ENEMY_HALF_HEIGHT 38

#define MAX_SCREEN_HEIGHT 752

#define MIN_SCREEN_HEIGHT 272

#define BOTTOM_OF_SCREEN 224

// Demo mode:
#define KILL_TO_EVOLVE 10

//// Release mode:
//#define KILL_TO_EVOLVE 25

// Demo mode:
#define BOOST_TO_EVOLVE 15

//// Release mode:
//#define BOOST_TO_EVOLVE 25

#define MIN_STAT 1

#define MAX_STAT 2

#define BEHAVIOR_DIST 250


// Global variable that contains the main character that
// the user controls in the game.
Character* mainCharacter;


#endif
