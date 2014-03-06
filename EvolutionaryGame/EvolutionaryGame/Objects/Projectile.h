//
//  Projectile.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/28/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Projectile : SKSpriteNode

// In range [0, 1]
@property double velocity;

// Range of the projectile (in pixels)
@property double range;

// Current heading of the projectile (in radians)
@property double heading;

- (id) initWithDirection:(double) heading;

- (void) move;

@end
