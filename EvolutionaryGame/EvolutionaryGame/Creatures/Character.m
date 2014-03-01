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
        _walkLeft1 = [SKTexture textureWithImageNamed:@"PlayerCharL1.gif"];
        _walkLeft2 = [SKTexture textureWithImageNamed:@"PlayerCharL2.gif"];
        _walkRight1 = [SKTexture textureWithImageNamed:@"PlayerCharR1.gif"];
        _walkRight2 = [SKTexture textureWithImageNamed:@"PlayerCharR2.gif"];
        
        _walkLeftWeapon1 = [SKTexture textureWithImageNamed:@"PlayerCharWeaponL1.gif"];
        _walkLeftWeapon2 = [SKTexture textureWithImageNamed:@"PlayerCharWeaponL2.gif"];
        _walkRightWeapon1 = [SKTexture textureWithImageNamed:@"PlayerCharWeaponR1.gif"];
        _walkRightWeapon2 = [SKTexture textureWithImageNamed:@"PlayerCharWeaponR2.gif"];
    }
    
    return self;
}

- (void) changeTexture
{
    // Make changes to the Character's appearance here
    
    if (self.xVelocity > 0) {
        // If the velocity is positive, then we are moving to the right
        if (self.texture == _walkRight1) {
            self.texture = _walkRight2;
        } else {
            self.texture = _walkRight1;
        }
        
    } else if (self.xVelocity < 0) {
        // If the velocity is negative, then we are moving to the left
        if (self.texture == _walkLeft1) {
            self.texture = _walkLeft2;
        } else {
            self.texture = _walkLeft1;
        }
    }
    
    // TODO: Add functionality to handle whethr the Character is firing projectiles

}

- (void) fireProjectile
{
    // Deal with the weapon stuff here...
}


@end
