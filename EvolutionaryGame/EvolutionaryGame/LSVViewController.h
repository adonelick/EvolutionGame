//
//  LSVViewController.h
//  EvolutionaryGame
//

//  Copyright (c) 2014 CS121. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "LSVMyScene.h"

@interface LSVViewController : UIViewController <AVAudioPlayerDelegate> {

    AVAudioPlayer *player;
    IBOutlet UILabel *healthStatsLabel;
    float health;
    /*IBOutlet UILabel *powerStatsLabel;
    IBOutlet UILabel *toEvolutionStatsLabel;
    IBOutlet UILabel *formLabel;
    IBOutlet UILabel *jumpHeightStatsLabel;
    IBOutlet UILabel *strengthStatsLabel;*/
    AVAudioPlayer *shoot;
}

@property (nonatomic, retain) AVAudioPlayer *player;

@property (nonatomic, retain) IBOutlet UILabel *healthStatsLabel;

@property LSVMyScene* scene;

@end
