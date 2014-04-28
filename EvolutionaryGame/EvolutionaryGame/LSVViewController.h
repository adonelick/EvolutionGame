//
//  LSVViewController.h
//  EvolutionaryGame
//

//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import "LSVMyScene.h"

@interface LSVViewController : UIViewController <AVAudioPlayerDelegate> {
    
    AVAudioPlayer *player;
}

@property (nonatomic, retain) AVAudioPlayer *player;

@property LSVMyScene* scene;

@end
