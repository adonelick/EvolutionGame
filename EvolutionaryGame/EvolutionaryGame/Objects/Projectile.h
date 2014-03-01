//
//  Projectile.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/28/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Projectile : SKSpriteNode

@property double maxSpeed;
@property double range;
@property Boolean isTravelingRight;

- (id) initWithDirection:(Boolean) isTravelingRight;

@end
