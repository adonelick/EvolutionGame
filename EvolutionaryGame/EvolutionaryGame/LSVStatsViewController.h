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
    IBOutlet UILabel *iceLabel;
    IBOutlet UILabel *fireLabel;
    IBOutlet UILabel *lightningLabel;
    IBOutlet UILabel *earthLabel;
    IBOutlet UILabel *waterLabel;
    
    IBOutlet UILabel *jumpLabel;
    IBOutlet UILabel *strengthLabel;
    IBOutlet UILabel *runLabel;
    IBOutlet UILabel *climbLabel;
    IBOutlet UILabel *breathLabel;
    
    IBOutlet UILabel *healthLabel;
    IBOutlet UILabel *powerLabel;
    IBOutlet UILabel *evolutionLabel;
    IBOutlet UILabel *formLabel;
    
    IBOutlet UILabel *weaponFormLabel;
    IBOutlet UILabel *enemiesKilledLabel;
    IBOutlet UILabel *weaponEvolutionLabel;
    
    IBOutlet UILabel *weaponIceLabel;
    IBOutlet UILabel *weaponFireLabel;
    IBOutlet UILabel *weaponLightningLabel;
    IBOutlet UILabel *weaponEarthLabel;
    IBOutlet UILabel *weaponWaterLabel;

    float ice;
    float fire;
    float lightning;
    float earth;
    float water;
    
    float jump;
    float strength;
    float run;
    float climb;
    float breath;
    
    float health;
    NSString *power;
    float evolution;
    NSString *form;
    
    NSString *weaponForm;
    int enemiesKilled;
    float weaponEvolution;
    
    float weaponIce;
    float weaponFire;
    float weaponLightning;
    float weaponEarth;
    float weaponWater;
}

@property (nonatomic, retain) IBOutlet UILabel *iceLabel;
@property (nonatomic, retain) IBOutlet UILabel *fireLabel;
@property (nonatomic, retain) IBOutlet UILabel *lightningLabel;
@property (nonatomic, retain) IBOutlet UILabel *earthLabel;
@property (nonatomic, retain) IBOutlet UILabel *waterLabel;

@property (nonatomic, retain) IBOutlet UILabel *jumpLabel;
@property (nonatomic, retain) IBOutlet UILabel *strengthLabel;
@property (nonatomic, retain) IBOutlet UILabel *runLabel;
@property (nonatomic, retain) IBOutlet UILabel *climbLabel;
@property (nonatomic, retain) IBOutlet UILabel *breathLabel;

@property (nonatomic, retain) IBOutlet UILabel *healthLabel;
@property (nonatomic, retain) IBOutlet UILabel *powerLabel;
@property (nonatomic, retain) IBOutlet UILabel *evolutionLabel;
@property (nonatomic, retain) IBOutlet UILabel *formLabel;

@property (nonatomic, retain) IBOutlet UILabel *weaponFormLabel;
@property (nonatomic, retain) IBOutlet UILabel *enemiesKilledLabel;
@property (nonatomic, retain) IBOutlet UILabel *weaponEvolutionLabel;

@property (nonatomic, retain) IBOutlet UILabel *weaponIceLabel;
@property (nonatomic, retain) IBOutlet UILabel *weaponFireLabel;
@property (nonatomic, retain) IBOutlet UILabel *weaponLightningLabel;
@property (nonatomic, retain) IBOutlet UILabel *weaponEarthLabel;
@property (nonatomic, retain) IBOutlet UILabel *weaponWaterLabel;

@end
