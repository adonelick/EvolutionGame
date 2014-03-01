//
//  LSVMyScene.h
//  EvolutionaryGame
//

//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Projectile.h"

@interface LSVMyScene : SKScene

@property NSMutableArray* projectiles;

- (void) addProjectile:(Projectile*) projectile;

@end
