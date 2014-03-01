//
//  Platform.h
//  EvolutionaryGame
//
//  Created by CS121 on 2/22/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Platform : SKSpriteNode


// At the moment, a platform is just rectangle with a color
@property int xSize;
@property int ySize;
@property SKColor* backgroundColor;


@end
