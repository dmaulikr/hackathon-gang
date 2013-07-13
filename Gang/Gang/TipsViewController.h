//
//  TipsViewController.h
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import <UIKit/UIKit.h>
#import <CollapseClick/CollapseClick.h>

@interface TipsViewController : UIViewController <CollapseClickDelegate> {
    __weak IBOutlet CollapseClick *myCollapseClick;
}

@end
