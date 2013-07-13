//
//  TipsViewController.m
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import "TipsViewController.h"
#import <UIColor+MLPFlatColors/UIColor+MLPFlatColors.h>

@interface TipsViewController ()

@end

@implementation TipsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor flatWhiteColor];
    [[self.navigationController navigationBar] setTintColor:[UIColor flatWhiteColor]];
    
    myCollapseClick.CollapseClickDelegate = self;
    [myCollapseClick reloadCollapseClick];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(int)numberOfCellsForCollapseClick {
    return 4;
}

-(NSString *)titleForCollapseClickAtIndex:(int)index {
    NSDictionary *dict = [self dataForIndex:index];
    return [dict objectForKey:@"title"];
}

-(UIView *)viewForCollapseClickContentViewAtIndex:(int)index {
    NSDictionary *dict = [self dataForIndex:index];
    
    CGSize stringSize = [[dict objectForKey:@"description"] sizeWithFont:[UIFont fontWithName:@"AvenirNext-Medium" size:16]
                          constrainedToSize:CGSizeMake(320, MAXFLOAT)
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, stringSize.height + 10)];
    textView.scrollEnabled = NO;
    textView.userInteractionEnabled = NO;
    textView.editable = NO;
    textView.backgroundColor = [UIColor clearColor];
    textView.font = [UIFont fontWithName:@"AvenirNext-Medium" size:16];
    textView.text = [dict objectForKey:@"description"];

    return textView;
}

-(UIColor *)colorForCollapseClickTitleViewAtIndex:(int)index {
    return [UIColor flatDarkGreenColor];
}

// Setting the image of the tab.
- (NSString *)tabImageName
{
    return @"42-info";
}

// Setting the title of the tab.
- (NSString *)tabTitle
{
    return @"Info";
}

- (NSDictionary *)dataForIndex:(int)index {
    NSDictionary *data = nil;
    if (index == 0) {
        data = @{
                 @"title": @"What is a gang?",
                 @"description" : @"A gang is an organized group with a recognized leader whose activities are either criminal or, at the very least, threatening to the community. Although gang members are part of these organizations, they rarely acknowledge their own roles as contributing to the problems in that community. Gangs display their identity and unity in obvious ways such as jewelry, colored clothing, jargon, and signals. Members remain together in quiet times as well as in conflict. In response to this twisted loyalty, members are rewarded by being accepted and recognized as a gang member. The main source of income for most gangs is narcotics. Members of all ages are used by the gang in the illegal sale of narcotics and other unlawful activities. It is a mistaken belief that gangs only operate in less affluent neighborhoods. Gangs exist in virtually every community in Chicago. And while there are many individual street gangs in Chicago, most gangs also belong to one of two alliances, either \"People\" or \"Folks.\" The alliances are not aligned along traditional racial boundaries, and both contain black, white, and Hispanic street gangs. Both alliances are alive and well on Chicago's streets, and in most cases are bitter rivals. The \"People\" gangs all wear their identifiers to the left side, while the \"Folks\" gangs wear their identifiers on the right."};
    }
    if (index == 1) {
        data = @{
                 @"title": @"Who belongs to gangs?",
                 @"description" : @"Gangs use a variety of methods to recruit new members, targeting in recent years younger and younger members because of the less stringent penalties for juvenile offenders. Gangs actively recruit youngsters age 15 and younger to carry out risky assignments or carry the weapons or drugs. Females are also recruited and influenced into similar activities.\nThe profile of a typical gang member is a male school dropout or truant, who is unemployed or has no employable skills. The gang member is usually in trouble with the police and does not receive adequate family attention. The gang provides identity and status and, in return, the member develops a fierce loyalty to the gang and nation.\nVirtually all gangs have oaths, pledges, mission statements, etc., and a set of rules known as \"laws\" which each member must memorize and adhere to. Loyalty is demanded in every aspect of the gang philosophy. Respect for the gang as a \"nation\" is taught. The gang founders and past and present leaders are glorified in many of these oaths and rituals.\nStreet gangs are divided into three basic components: (1) leaders direct the nature and basic pattern of the gang members; (2) hard-core members, who participate in the gang as a life line, are violent and have the ability to orchestrate criminal activity; and (3) marginal members, who drift into and out of gang activities according to their needs. They lack direction, and may initially find intrigue and camaraderie from the gang.\nLeaders and hard-core members are often very threatening and easy to identify. Marginal members, on the other hand, are very difficult for the average adult to detect because they do not exhibit the typical gang demeanor. Often these individuals are no more than sympathizers or wanna-bes who are not committed to the gang mentality. Many start into criminal activities and drugs, working into hard-core status and may even kill to become part of the gang or to prove themselves."};

    }
    if (index == 2) {
        data = @{
                 @"title": @"What are street gang identifiers?",
                 @"description" : @"All street gangs utilize one or more visible indicators. These identifiers are as varied as the imagination and ingenuity that the members have. Typically gang members use graffiti, hand signs, tattoos, and colors to signify their membership in a gang, and to communicate their gang affiliation to others. Each street gang has its own unique signal, sign, colors, jewelry, and/or dress. These serve not only to identify gang members, but also to promote group solidarity"};
        
    }
    
    if (index == 3) {
        data = @{
                 @"title": @"What can be done to stop or control gangs?",
                 @"description" : @"The more aware the community is, the better prepared it is to deal with gang problems. The Chicago Police Department holds frequent workshops on gangs and gang awareness throughout the City. These workshops and discussions will help you learn how to recognize gang behavior in your children, how to cope, and how to fight back. Call the Preventive Services Section at 747-5490 to arrange a gang workshop in your community.\nThe best defense against gangs begins in the home. Parents should be aware of the identifiers gangs use and be aware if they begin to appear on the personal articles of their children. Book bags, posters, and gang colors are used to convey the gang message. Parents should be also alert that their homes are not being used by the gang to hide weapons or narcotics.\nBy directing your children into constructive activities and by knowing their friends, parents can help protect their children and their communities.\nRemoving graffiti from your property as soon as possible, and as often as necessary, is another way to stand up to gangs. Graffiti often indicates gang activity in your community, and allowing graffiti to remain is seen as giving in to the gang. Call the City's Graffiti Blasters program at 744-1234 to have graffiti removed for free from your property.\nObserving Chicago's curfew law is another way to avoid gangs and gang activity. In Chicago, children under age 17 must be inside by 10:30 on week nights, and 11:30 on Friday and Saturday nights.\nFinally, don't take unnecessary risks with gangs, but don't be intimidated either. You are not alone. If you need advice or want to get together with your neighbors to team up against gangs, call your the Neighborhood Relations Office in your local Police Districts. And call 746-GANG to anonymously report gang crime activity."};

    }
    
    return data;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
