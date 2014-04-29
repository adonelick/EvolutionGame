//
//  LSVStatsViewController.h
//  EvolutionaryGame
//
//  Created by Alix Joe on 4/29/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import "LSVMyScene.h"

@interface LSVStatsViewController : UIViewController {
    IBOutlet UILabel *strengthLabel;
    float strength;
}

@property (nonatomic, retain) IBOutlet UILabel *strengthLabel;

@end
