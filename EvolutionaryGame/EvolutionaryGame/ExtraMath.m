//
//  ExtraMath.m
//  EvolutionaryGame
//
//  Created by CS121 on 3/2/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "ExtraMath.h"

@implementation ExtraMath

+ (double) distanceBetween:(CGPoint) p1 and:(CGPoint) p2
{
    float x1 = p1.x;
    float y1 = p1.y;
    
    float x2 = p2.x;
    float y2 = p2.y;
    
    return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
}

@end
