//
//  Platform.m
//  EvolutionaryGame
//
//  Created by CS121 on 2/22/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "Platform.h"

@implementation Platform

- (id) init:(NSString*) imageName
{
    self = [super initWithImageNamed:imageName];
    
    if (self) {
        self.xPos = self.position.x;
        self.yPos = self.position.y;
    }
    
    return self;
}

@end
