//
//  Platform.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/22/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Platform : SKSpriteNode

// x position of the platform
@property int xPos;

// y position of the platform
@property int yPos;

// initialization function that takes in a name of a file to initialize the piece with
-(id) init:(NSString*) imageName;

@end
