//
//  LSVViewController.h
//  EvolutionaryGame
//

//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface LSVViewController : UIViewController

// Create timers to control the characters movements
//   We create three different timers so that the character can
//   do all three types of movements at once
@property NSTimer* leftTimer;
@property NSTimer* rightTimer;
@property NSTimer* jumpTimer;


@end
