//
//  ViewController.m
//  passcodeTroll
//
//  Created by MadelynNelson on 3/8/16.
//  Copyright (c) 2016 Madelyn Nelson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSString *myFont;
float sw;
float sh;
float buttonRadius;
float buttonDist;
float dotRadius;
float emergencyCancelBuffer = 10;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    sw = [[UIScreen mainScreen] bounds].size.width;
    sh = [[UIScreen mainScreen] bounds].size.height;
    buttonRadius = 35;
    buttonDist = 20;
    dotRadius = 6;
    
    [self setNeedsStatusBarAppearanceUpdate];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:.2 alpha:.65]];

    [self loadKeypad];
    [self loadDots];
    [self loadEnterPasscodeLabel];
    [self emergencyAndCancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)emergencyAndCancel
{
    float emergencyCenter = sw*.5-(2*buttonRadius+buttonDist);
    float cancelCenter = sw*.5+(2*buttonRadius+buttonDist);
    
    UILabel *emergency = [[UILabel alloc] initWithFrame:CGRectMake(emergencyCenter-sw/6, sh-7*dotRadius, sw/3, 4*dotRadius)];
    emergency.text = @"Emergency";
    emergency.textColor = [UIColor whiteColor];
    emergency.textAlignment = NSTextAlignmentCenter;
    [emergency setFont:[UIFont fontWithName:myFont size:14]];
    [self.view addSubview:emergency];
    
    
    UILabel *cancel= [[UILabel alloc] initWithFrame:CGRectMake(cancelCenter-sw/6, sh-7*dotRadius, sw/3, 4*dotRadius)];
    cancel.text = @"Cancel";
    cancel.textColor = [UIColor whiteColor];
    cancel.textAlignment = NSTextAlignmentCenter;
    [cancel setFont:[UIFont fontWithName:myFont size:14]];
    [self.view addSubview:cancel];
}

- (void)loadEnterPasscodeLabel
{
    UILabel *epLabel = [[UILabel alloc] initWithFrame:CGRectMake(sw/3, sh*.10-1, sw/3, dotRadius*4)];
    epLabel.text = @"Enter Passcode";
    epLabel.textColor = [UIColor whiteColor];
    epLabel.textAlignment = NSTextAlignmentCenter;
    [epLabel setFont:[UIFont fontWithName:myFont size:15]];
    [self.view addSubview:epLabel];
}

- (void)loadDots
{
    UIView *dotsView = [[UIView alloc] initWithFrame:CGRectMake(sw/3, sh*.16, sw/3, dotRadius+1)];
    int i = 0;
    float dotDist = (sw/3-8*dotRadius)/3;
    for (i = 0; i < 4; i++)
    {
        UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(i*(2*dotRadius+dotDist), 0, 2*dotRadius, 2*dotRadius)];
        dot.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
        dot.layer.borderWidth = 1;
        dot.layer.cornerRadius = dotRadius;
        [dotsView addSubview:dot];
    }
    [self.view addSubview:dotsView];
}

- (void)loadKeypad
{
    int i = 0;
    int j = 0;
    int count = 1;
    float a = (2*buttonRadius+buttonDist);
    
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 3; j++)
        {
            UIView *one = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-a + j*a, sh*.23 + i*a, 2*buttonRadius, 2*buttonRadius)];
                one.layer.cornerRadius = buttonRadius;
                one.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
            one.layer.borderWidth = 1;
            UILabel *oneLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
            oneLabel.text = [NSString stringWithFormat:@"%i", count];
            count++;
            oneLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
            [oneLabel setFont:[UIFont fontWithName:myFont size:32]];
            oneLabel.textAlignment = NSTextAlignmentCenter;
            [one addSubview:oneLabel];
            [self.view addSubview:one];
        }
    }
    
    UIView *zero = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+3*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    zero.layer.cornerRadius = buttonRadius;
    zero.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    zero.layer.borderWidth = 1;
    UILabel *zeroLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    zeroLabel.text = @"0";
    zeroLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [zeroLabel setFont:[UIFont fontWithName:myFont size:32]];
    zeroLabel.textAlignment = NSTextAlignmentCenter;
    [zero addSubview:zeroLabel];
    [self.view addSubview:zero];
    
    /*
    UIView *two = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23, 2*buttonRadius, 2*buttonRadius)];
    two.layer.cornerRadius = buttonRadius;
    two.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    two.layer.borderWidth = 1;
    UILabel *twoLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    twoLabel.text = @"2";
    twoLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [twoLabel setFont:[UIFont fontWithName:myFont size:32]];
    twoLabel.textAlignment = NSTextAlignmentCenter;
    [two addSubview:twoLabel];
    [self.view addSubview:two];
    
    UIView *three = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23, 2*buttonRadius, 2*buttonRadius)];
    three.layer.cornerRadius = buttonRadius;
    three.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    three.layer.borderWidth = 1;
    UILabel *threeLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    threeLabel.text = @"3";
    threeLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [threeLabel setFont:[UIFont fontWithName:myFont size:32]];
    threeLabel.textAlignment = NSTextAlignmentCenter;
    [three addSubview:threeLabel];
    [self.view addSubview:three];
    
    
    
    
    UIView *four = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-(2*buttonRadius+buttonDist), sh*.23+(2*buttonRadius+20), 2*buttonRadius, 2*buttonRadius)];
    four.layer.cornerRadius = buttonRadius;
    four.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    four.layer.borderWidth = 1;
    UILabel *fourLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    fourLabel.text = @"4";
    fourLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [fourLabel setFont:[UIFont fontWithName:myFont size:32]];
    fourLabel.textAlignment = NSTextAlignmentCenter;
    [four addSubview:fourLabel];
    [self.view addSubview:four];
    
    UIView *five = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    five.layer.cornerRadius = buttonRadius;
    five.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    five.layer.borderWidth = 1;
    UILabel *fiveLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    fiveLabel.text = @"5";
    fiveLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [fiveLabel setFont:[UIFont fontWithName:myFont size:32]];
    fiveLabel.textAlignment = NSTextAlignmentCenter;
    [five addSubview:fiveLabel];
    [self.view addSubview:five];
    
    UIView *six = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23+(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    six.layer.cornerRadius = buttonRadius;
    six.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    six.layer.borderWidth = 1;
    UILabel *sixLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    sixLabel.text = @"6";
    sixLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [sixLabel setFont:[UIFont fontWithName:myFont size:32]];
    sixLabel.textAlignment = NSTextAlignmentCenter;
    [six addSubview:sixLabel];
    [self.view addSubview:six];
    
    
    
    
    
    
    UIView *seven = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-(2*buttonRadius+20), sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    seven.layer.cornerRadius = buttonRadius;
    seven.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    seven.layer.borderWidth = 1;
    UILabel *sevenLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    sevenLabel.text = @"7";
    sevenLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [sevenLabel setFont:[UIFont fontWithName:myFont size:32]];
    sevenLabel.textAlignment = NSTextAlignmentCenter;
    [seven addSubview:sevenLabel];
    [self.view addSubview:seven];
    
    UIView *eight = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    eight.layer.cornerRadius = buttonRadius;
    eight.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    eight.layer.borderWidth = 1;
    UILabel *eightLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    eightLabel.text = @"8";
    eightLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [eightLabel setFont:[UIFont fontWithName:myFont size:32]];
    eightLabel.textAlignment = NSTextAlignmentCenter;
    [eight addSubview:eightLabel];
    [self.view addSubview:eight];
    
    UIView *nine = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    nine.layer.cornerRadius = buttonRadius;
    nine.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    nine.layer.borderWidth = 1;
    UILabel *nineLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    nineLabel.text = @"9";
    nineLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [nineLabel setFont:[UIFont fontWithName:myFont size:32]];
    nineLabel.textAlignment = NSTextAlignmentCenter;
    [nine addSubview:nineLabel];
    [self.view addSubview:nine];
 */
    

}


@end
