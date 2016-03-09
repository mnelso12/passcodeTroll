//
//  ViewController.m
//  passcodeTroll
//
//  Created by MadelynNelson on 3/8/16.
//  Copyright (c) 2016 Madelyn Nelson. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@end

NSString *myFont;
float sw;
float sh;
float buttonRadius;
float buttonDist;
float dotRadius;
float emergencyCancelBuffer = 10;
int numEntered; // 0, 1, 2, 3, or 4, for little dots to know how many to fill in

UIView *dotsView;
UIView *dot1;
UIView *dot2;
UIView *dot3;
UIView *dot4;

UIView *one;
UIView *two;
UIView *three;
UIView *four;
UIView *five;
UIView *six;
UIView *seven;
UIView *eight;
UIView *nine;
UIView *zero;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    sw = [[UIScreen mainScreen] bounds].size.width;
    sh = [[UIScreen mainScreen] bounds].size.height;
    buttonRadius = 35;
    buttonDist = 20;
    dotRadius = 6;
    numEntered = 0;
    
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
    
    UITapGestureRecognizer *delTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(delTap:)];
    UILabel *cancel= [[UILabel alloc] initWithFrame:CGRectMake(cancelCenter-sw/6, sh-7*dotRadius, sw/3, 4*dotRadius)];
    cancel.userInteractionEnabled = YES;
    [cancel addGestureRecognizer:delTap];
    cancel.text = @"Delete";
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
    dotsView = [[UIView alloc] initWithFrame:CGRectMake(sw/3, sh*.16, sw/3, dotRadius+1)];
    
    int i = 0;
    float dotDist = (sw/3-8*dotRadius)/3;
    /*for (i = 0; i < 4; i++)
    {
        UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(i*(2*dotRadius+dotDist), 0, 2*dotRadius, 2*dotRadius)];
        dot.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
        dot.layer.borderWidth = 1;
        dot.layer.cornerRadius = dotRadius;
        [dotsView addSubview:dot];
    }
     */
    i=0;
    dot1 = [[UIView alloc] initWithFrame:CGRectMake(i*(2*dotRadius+dotDist), 0, 2*dotRadius, 2*dotRadius)];
    dot1.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    dot1.layer.borderWidth = 1;
    dot1.layer.cornerRadius = dotRadius;
    [dotsView addSubview:dot1];
    
    i=1;
    dot2 = [[UIView alloc] initWithFrame:CGRectMake(i*(2*dotRadius+dotDist), 0, 2*dotRadius, 2*dotRadius)];
    dot2.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    dot2.layer.borderWidth = 1;
    dot2.layer.cornerRadius = dotRadius;
    [dotsView addSubview:dot2];
    
    i=2;
    dot3 = [[UIView alloc] initWithFrame:CGRectMake(i*(2*dotRadius+dotDist), 0, 2*dotRadius, 2*dotRadius)];
    dot3.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    dot3.layer.borderWidth = 1;
    dot3.layer.cornerRadius = dotRadius;
    [dotsView addSubview:dot3];
    
    i=3;
    dot4 = [[UIView alloc] initWithFrame:CGRectMake(i*(2*dotRadius+dotDist), 0, 2*dotRadius, 2*dotRadius)];
    dot4.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    dot4.layer.borderWidth = 1;
    dot4.layer.cornerRadius = dotRadius;
    [dotsView addSubview:dot4];
    
    
    [self.view addSubview:dotsView];
}

- (void)updateDots // for filling in dots
{
    //UIView *dotsView = [[UIView alloc] initWithFrame:CGRectMake(sw/3, sh*.16, sw/3, dotRadius+1)];
    //int i = 0;
    //float dotDist = (sw/3-8*dotRadius)/3;
    
    if (numEntered == 0) // acts as a reset for the dot fillings
    {
        dot1.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
        dot1.layer.borderWidth = 1;
        dot1.backgroundColor = [UIColor clearColor];
        
        dot2.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
        dot2.layer.borderWidth = 1;
        dot2.backgroundColor = [UIColor clearColor];
        
        dot3.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
        dot3.layer.borderWidth = 1;
        dot3.backgroundColor = [UIColor clearColor];
        
        dot4.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
        dot4.layer.borderWidth = 1;
        dot4.backgroundColor = [UIColor clearColor];
    }
    else if (numEntered == 1)
    {
        dot1.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
        dot1.layer.borderWidth = 0;
    }
    else if (numEntered == 2)
    {
        dot2.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
        dot2.layer.borderWidth = 0;
    }
    else if (numEntered == 3)
    {
        dot3.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
        dot3.layer.borderWidth = 0;
    }
    else if (numEntered == 4)
    {
        dot4.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
        dot4.layer.borderWidth = 0;
        [self passcodeIsWrong];
    }
    else
    {
        NSLog(@"should never happen");
    }
}

- (void)passcodeIsWrong
{
    // shake dots
    CABasicAnimation *animation =
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.075];
    [animation setRepeatCount:3];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([dotsView center].x - 35.0f, [dotsView center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([dotsView center].x + 35.0f, [dotsView center].y)]];
    [[dotsView layer] addAnimation:animation forKey:@"position"];
    
    // reset number backgrounds
    [self resetNumBackgrounds];
    
    // reset dot backgrounds
    numEntered = 0;
    [self updateDots];

}

- (void)resetNumBackgrounds
{
    zero.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    zero.layer.borderWidth = 1;
    zero.backgroundColor = [UIColor clearColor];
    
    one.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    one.layer.borderWidth = 1;
    one.backgroundColor = [UIColor clearColor];
    
    two.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    two.layer.borderWidth = 1;
    two.backgroundColor = [UIColor clearColor];
    
    three.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    three.layer.borderWidth = 1;
    three.backgroundColor = [UIColor clearColor];
    
    four.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    four.layer.borderWidth = 1;
    four.backgroundColor = [UIColor clearColor];
    
    five.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    five.layer.borderWidth = 1;
    five.backgroundColor = [UIColor clearColor];
    
    six.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    six.layer.borderWidth = 1;
    six.backgroundColor = [UIColor clearColor];
    
    seven.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    seven.layer.borderWidth = 1;
    seven.backgroundColor = [UIColor clearColor];
    
    eight.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    eight.layer.borderWidth = 1;
    eight.backgroundColor = [UIColor clearColor];
    
    nine.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    nine.layer.borderWidth = 1;
    nine.backgroundColor = [UIColor clearColor];

}

- (void)delTap:(UITapGestureRecognizer *)gesture
{
    if (numEntered >= 1)
    {
        numEntered--;
    }
    else
    {
        numEntered = 0;
    }
    [self updateDots];
}

- (void)tapAction0:(UITapGestureRecognizer *)gesture
{
    NSLog(@"0");
    [self resetNumBackgrounds];
    zero.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    zero.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction1:(UITapGestureRecognizer *)gesture
{
    NSLog(@"1");
    [self resetNumBackgrounds];
    one.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    one.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction2:(UITapGestureRecognizer *)gesture
{
    NSLog(@"2");
    [self resetNumBackgrounds];
    two.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    two.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction3:(UITapGestureRecognizer *)gesture
{
    NSLog(@"3");
    [self resetNumBackgrounds];
    three.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    three.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction4:(UITapGestureRecognizer *)gesture
{
    NSLog(@"4");
    [self resetNumBackgrounds];
    four.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    four.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction5:(UITapGestureRecognizer *)gesture
{
    NSLog(@"5");
    [self resetNumBackgrounds];
    five.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    five.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction6:(UITapGestureRecognizer *)gesture
{
    NSLog(@"6");
    [self resetNumBackgrounds];
    six.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    six.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction7:(UITapGestureRecognizer *)gesture
{
    NSLog(@"7");
    [self resetNumBackgrounds];
    seven.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    seven.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction8:(UITapGestureRecognizer *)gesture
{
    NSLog(@"8");
    [self resetNumBackgrounds];
    eight.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    eight.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}

- (void)tapAction9:(UITapGestureRecognizer *)gesture
{
    NSLog(@"9");
    [self resetNumBackgrounds];
    nine.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    nine.layer.borderWidth = 0;
    numEntered++;
    [self updateDots];
}


- (void)loadKeypad
{
   // int i = 0;
   // int j = 0;
    int count = 1;
   // float a = (2*buttonRadius+buttonDist);
    
    /*
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 3; j++)
        {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            UIView *one = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-a + j*a, sh*.23 + i*a, 2*buttonRadius, 2*buttonRadius)];
                one.layer.cornerRadius = buttonRadius;
                one.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
            one.layer.borderWidth = 1;
            UILabel *oneLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
            oneLabel.text = [NSString stringWithFormat:@"%i", count];
            one.tag = count;
            one.userInteractionEnabled = YES;
            [one addGestureRecognizer:tap];
            count++;
            oneLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
            [oneLabel setFont:[UIFont fontWithName:myFont size:32]];
            oneLabel.textAlignment = NSTextAlignmentCenter;
            [one addSubview:oneLabel];
            [self.view addSubview:one];
        }
    }
    */
    UITapGestureRecognizer *tap0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction0:)];
    zero = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+3*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    zero.tag = 0;
    zero.userInteractionEnabled = YES;
    [zero addGestureRecognizer:tap0];
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
    
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
    one = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-(2*buttonRadius+buttonDist), sh*.23, 2*buttonRadius, 2*buttonRadius)];
    one.layer.cornerRadius = buttonRadius;
    one.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65].CGColor;
    one.layer.borderWidth = 1;
    UILabel *oneLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonRadius*.5, buttonRadius*.5, buttonRadius, buttonRadius)];
    oneLabel.text = [NSString stringWithFormat:@"%i", count];
    one.tag = count;
    one.userInteractionEnabled = YES;
    [one addGestureRecognizer:tap1];
    count++;
    oneLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
    [oneLabel setFont:[UIFont fontWithName:myFont size:32]];
    oneLabel.textAlignment = NSTextAlignmentCenter;
    [one addSubview:oneLabel];
    [self.view addSubview:one];

    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction2:)];
    two = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23, 2*buttonRadius, 2*buttonRadius)];
    two.tag = count;
    two.userInteractionEnabled = YES;
    [two addGestureRecognizer:tap2];
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
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction3:)];
    three = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23, 2*buttonRadius, 2*buttonRadius)];
    three.userInteractionEnabled = YES;
    [three addGestureRecognizer:tap3];
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
    
    
    
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction4:)];
    four = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-(2*buttonRadius+buttonDist), sh*.23+(2*buttonRadius+20), 2*buttonRadius, 2*buttonRadius)];
    four.userInteractionEnabled = YES;
    [four addGestureRecognizer:tap4];
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
    
    
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction5:)];
    five = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    five.userInteractionEnabled = YES;
    [five addGestureRecognizer:tap5];
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
    
    UITapGestureRecognizer *tap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction6:)];UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    six = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23+(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    six.userInteractionEnabled = YES;
    [six addGestureRecognizer:tap6];
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
    
    
    
    
    
    UITapGestureRecognizer *tap7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction7:)];
    seven = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-(2*buttonRadius+20), sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    seven.userInteractionEnabled = YES;
    [seven addGestureRecognizer:tap7];
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
    
    UITapGestureRecognizer *tap8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction8:)];
    eight = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    eight.userInteractionEnabled = YES;
    [eight addGestureRecognizer:tap8];
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
    
    UITapGestureRecognizer *tap9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction9:)];
    nine = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
    nine.userInteractionEnabled = YES;
    [nine addGestureRecognizer:tap9];
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
    

}


@end
