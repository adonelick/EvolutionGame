//
//  SmokeHazard.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/30/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "SmokeHazard.h"

@implementation SmokeHazard

- (id) init
{
    // TODO: Change the file name to the name of the smoke image
    self = [super initWithImageNamed:@"SmokeScreen1.gif"];
    
    if (self)
    {
        // Same 'TODO' as earlier here...
        _texture1 = [SKTexture textureWithImageNamed:@"SmokeScreen1.gif"];
        _texture2 = [SKTexture textureWithImageNamed:@"SmokeScreen2.gif"];
        
        // Does 25 hit points of damage per second
        _damagePotential = 25;
    }
    
    return self;
}

- (void) updateTexture
{
    if (self.texture == _texture1) {
        self.texture = _texture2;
    } else {
        self.texture = _texture1;
    }
}


@end
