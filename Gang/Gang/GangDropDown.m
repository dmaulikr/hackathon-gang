//
//  GangDropDown.m
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import "GangDropDown.h"
#import <QuartzCore/QuartzCore.h>
#import <UIColor+MLPFlatColors/UIColor+MLPFlatColors.h>

@implementation GangDropDown

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, -140, 320, 140);
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 2);
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.7;
        self.layer.masksToBounds = NO;
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 30)];
        self.titleLabel.text = @"YOU ARE IN:";
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor flatWhiteColor];
        self.titleLabel.font = [UIFont fontWithName:@"AvenirNext-Bold" size:28];
        [self addSubview:self.titleLabel];
        
        self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabel.frame.size.height + 10, 320, 30)];
        self.subtitleLabel.text = @"Gangster Disciple's Territory";
        self.subtitleLabel.backgroundColor = [UIColor clearColor];
        self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
        self.subtitleLabel.textColor = [UIColor flatWhiteColor];
        self.subtitleLabel.font = [UIFont fontWithName:@"AvenirNext-Bold" size:20];
        [self addSubview:self.subtitleLabel];
        
        self.descriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, self.subtitleLabel.frame.origin.y + self.subtitleLabel.frame.size.height - 5, 320, 75)];
        self.descriptionTextView.userInteractionEnabled = NO;
        self.descriptionTextView.textAlignment = NSTextAlignmentCenter;
        self.descriptionTextView.editable = NO;
        self.descriptionTextView.backgroundColor = [UIColor clearColor];
        self.descriptionTextView.textColor = [UIColor flatWhiteColor];
        self.descriptionTextView.font = [UIFont fontWithName:@"AvenirNext-Bold" size:14];
        [self addSubview:self.descriptionTextView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)tap {
    NSLog(@"%@", _gang.url);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_gang.url]];
}

+ (GangDropDown*)sharedDropdown {
    static dispatch_once_t pred;
    static id DefaultInstance = nil;
    dispatch_once(&pred, ^{
        DefaultInstance = [[GangDropDown alloc] init];
    });
    return DefaultInstance;
}

+ (void)showInView:(UIView *)view withGang:(Gang *)gang {
    GangDropDown *dropDown = [GangDropDown sharedDropdown];
    dropDown.gang = gang;
    if (![dropDown isDescendantOfView:view]) {
        [view addSubview:dropDown];
    }
    if (dropDown.shown) {
        [dropDown hideWithCompletion:^{
            [dropDown show];
            dropDown.backgroundColor = gang.gangColor;
            dropDown.subtitleLabel.text = gang.name;
            NSString  *gangDescription = gang.gangDescription;
            if (gangDescription.length > 100) {
                gangDescription = [[gangDescription substringToIndex:100] stringByAppendingString:@"..."];
            }
            dropDown.descriptionTextView.text = gangDescription;

        }];
    } else {
        [dropDown show];
        dropDown.backgroundColor = gang.gangColor;
        dropDown.subtitleLabel.text = gang.name;
        NSString  *gangDescription = gang.gangDescription;
        if (gangDescription.length > 100) {
            gangDescription = [[gangDescription substringToIndex:100] stringByAppendingString:@"..."];
        }
        dropDown.descriptionTextView.text = gangDescription;

    }
}

- (void)hideWithCompletion:(void (^)())completion {
    self.shown = FALSE;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, -140, 320, 160);

    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)show {
    self.shown = TRUE;
    
    [UIView beginAnimations:@"animateDown" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishedShowing)];
    self.frame = CGRectMake(0, 0, 320, 160);
    [UIView commitAnimations];
    
 
}

- (void)finishedShowing {
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 0, 320, 140);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
