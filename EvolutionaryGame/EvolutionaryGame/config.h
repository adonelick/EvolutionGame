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

#define PROJECTILE_DX 10
#define PROJECTILE_DY 7

#define KILL_DISTANCE 30

#define UPDATE_TIME 0.08


// Global variable that contains the main character that
// the user controls in the game.
Character* mainCharacter;


#endif
