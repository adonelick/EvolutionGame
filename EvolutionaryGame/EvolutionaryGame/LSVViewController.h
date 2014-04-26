//
//  LSVViewController.h
//  EvolutionaryGame
//

//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "LSVMyScene.h"

@interface LSVViewController : UIViewController

@property LSVMyScene* scene;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pauseButton;

@end
