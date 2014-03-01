//
//  LSVCharacter.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/19/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Character.h"

@implementation Character

- (id) init
{
    self = [super initWithImageNamed:@"PlayerCharR1.gif"];
    
    if (self) {
        // Create the textures from the image files
        _textureWalkLeft1 = [SKTexture textureWithImageNamed:@"PlayerCharL1.gif"];
        _textureWalkLeft2 = [SKTexture textureWithImageNamed:@"PlayerCharL2.gif"];
        _textureWalkRight1 = [SKTexture textureWithImageNamed:@"PlayerCharR1.gif"];
        _textureWalkRight2 = [SKTexture textureWithImageNamed:@"PlayerCharR2.gif"];
    }
    
    return self;
}

- (void) changeTexture
{
    
    if (self.xVelocity > 0) {
        
        if (self.texture == _textureWalkRight1) {
            self.texture = _textureWalkRight2;
        } else {
            self.texture = _textureWalkRight1;
        }
        
    } else if (self.xVelocity < 0) {
        
        if (self.texture == _textureWalkLeft1) {
            self.texture = _textureWalkLeft2;
        } else {
            self.texture = _textureWalkLeft1;
        }
    }

}


@end
