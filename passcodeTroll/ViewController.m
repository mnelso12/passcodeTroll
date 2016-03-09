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
    UIView *dotsView = [[UIView alloc] initWithFrame:CGRectMake(sw/3, sh*.16, sw/3, dotRadius+1)];
    int i = 0;
    float dotDist = (sw/3-8*dotRadius)/3;
    
    if (numEntered == 1)
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
    }
}

- (void)tapAction0:(UITapGestureRecognizer *)gesture
{
    NSLog(@"0");
    numEntered++;
    [self updateDots];
}

- (void)tapAction1:(UITapGestureRecognizer *)gesture
{
    NSLog(@"1");
    numEntered++;
    [self updateDots];
}

- (void)tapAction2:(UITapGestureRecognizer *)gesture
{
    NSLog(@"2");
    numEntered++;
    [self updateDots];
}

- (void)tapAction3:(UITapGestureRecognizer *)gesture
{
    NSLog(@"3");
    numEntered++;
    [self updateDots];
}

- (void)tapAction4:(UITapGestureRecognizer *)gesture
{
    NSLog(@"4");
    numEntered++;
    [self updateDots];
}

- (void)tapAction5:(UITapGestureRecognizer *)gesture
{
    NSLog(@"5");
    numEntered++;
    [self updateDots];
}

- (void)tapAction6:(UITapGestureRecognizer *)gesture
{
    NSLog(@"6");
    numEntered++;
    [self updateDots];
}

- (void)tapAction7:(UITapGestureRecognizer *)gesture
{
    NSLog(@"7");
    numEntered++;
    [self updateDots];
}

- (void)tapAction8:(UITapGestureRecognizer *)gesture
{
    NSLog(@"8");
    numEntered++;
    [self updateDots];
}

- (void)tapAction9:(UITapGestureRecognizer *)gesture
{
    NSLog(@"9");
    numEntered++;
    [self updateDots];
}


- (void)loadKeypad
{
    int i = 0;
    int j = 0;
    int count = 1;
    float a = (2*buttonRadius+buttonDist);
    
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
    UIView *zero = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+3*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
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
    UIView *one = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-(2*buttonRadius+buttonDist), sh*.23, 2*buttonRadius, 2*buttonRadius)];
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
    UIView *two = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23, 2*buttonRadius, 2*buttonRadius)];
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
    UIView *three = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23, 2*buttonRadius, 2*buttonRadius)];
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
    UIView *four = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-(2*buttonRadius+buttonDist), sh*.23+(2*buttonRadius+20), 2*buttonRadius, 2*buttonRadius)];
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
    UIView *five = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
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
    UIView *six = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23+(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
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
    UIView *seven = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius-(2*buttonRadius+20), sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
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
    UIView *eight = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius, sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
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
    UIView *nine = [[UIView alloc] initWithFrame:CGRectMake(sw*.5-buttonRadius+(2*buttonRadius+buttonDist), sh*.23+2*(2*buttonRadius+buttonDist), 2*buttonRadius, 2*buttonRadius)];
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
