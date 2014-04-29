//
//  LSVStatsViewController.m
//  EvolutionaryGame
//
//  Created by Alix Joe on 4/29/14.
//  Copyright (c) 2014 CS121. All rights reserved.
//

#import "LSVStatsViewController.h"
#import "LSVMyScene.h"
#import "config.h"
#import "LSVHealthView.h"

@interface LSVStatsViewController ()

@end

@implementation LSVStatsViewController

@synthesize iceLabel;
@synthesize fireLabel;
@synthesize lightningLabel;
@synthesize earthLabel;
@synthesize waterLabel;

@synthesize jumpLabel;
@synthesize strengthLabel;
@synthesize runLabel;
@synthesize climbLabel;
@synthesize breathLabel;

@synthesize healthLabel;
@synthesize powerLabel;
@synthesize evolutionLabel;
@synthesize formLabel;

@synthesize weaponFormLabel;
@synthesize enemiesKilledLabel;
@synthesize weaponEvolutionLabel;

@synthesize weaponIceLabel;
@synthesize weaponFireLabel;
@synthesize weaponLightningLabel;
@synthesize weaponEarthLabel;
@synthesize weaponWaterLabel;


/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController* statsDisplay = [storyboard instantiateViewControllerWithIdentifier:@"StatisticsDisplay"];
    
    ice = (200 * mainCharacter.stats.iceDef) - 100;
    [iceLabel setText:[NSString stringWithFormat:@"%d/300", (int)ice]];
    
    fire = (200 * mainCharacter.stats.fireDef) - 100;
    [fireLabel setText:[NSString stringWithFormat:@"%d/300", (int)fire]];
    
    lightning = (200 * mainCharacter.stats.lightningDef) - 100;
    [lightningLabel setText:[NSString stringWithFormat:@"%d/300", (int)lightning]];
    
    earth = (200 * mainCharacter.stats.earthDef) - 100;
    [earthLabel setText:[NSString stringWithFormat:@"%d/300", (int)earth]];
    
    water = (200 * mainCharacter.stats.waterDef) - 100;
    [waterLabel setText:[NSString stringWithFormat:@"%d/300", (int)water]];
    
    
    jump = mainCharacter.stats.jumpHeight*100;
    [jumpLabel setText:[NSString stringWithFormat:@"%d/250", (int)jump]];
    
    strength = mainCharacter.stats.strength*100;
    [strengthLabel setText:[NSString stringWithFormat:@"%d/250", (int)strength]];
    
    run = mainCharacter.stats.runSpeed*100;
    [runLabel setText:[NSString stringWithFormat:@"%d/250", (int)run]];
    
    climb = mainCharacter.stats.climb*100;
    [climbLabel setText:[NSString stringWithFormat:@"%d/250", (int)climb]];
    
    breath = mainCharacter.stats.breath*100;
    [breathLabel setText:[NSString stringWithFormat:@"%d/250", (int)breath]];
    
    
    weaponIce = (500*mainCharacter.weapon.stats.iceDamage)-250;
    [weaponIceLabel setText:[NSString stringWithFormat:@"%d/750", (int)weaponIce]];
    
    weaponFire = (500*mainCharacter.weapon.stats.fireDamage)-250;
    [weaponFireLabel setText:[NSString stringWithFormat:@"%d/750", (int)weaponFire]];
    
    weaponLightning = (500*mainCharacter.weapon.stats.lightningDamage)-250;
    [weaponLightningLabel setText:[NSString stringWithFormat:@"%d/750", (int)weaponLightning]];
    
    weaponEarth = (500*mainCharacter.weapon.stats.earthDamage)-250;
    [weaponEarthLabel setText:[NSString stringWithFormat:@"%d/750", (int)weaponEarth]];
    
    weaponWater = (500*mainCharacter.weapon.stats.waterDamage)-250;
    [weaponWaterLabel setText:[NSString stringWithFormat:@"%d/750", (int)weaponWater]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
