//
//  MainViewController.h
//  MyPano
//
//  Created by icreative-mini on 13-7-22.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAPanoView.h"

@interface MainViewController : UIViewController
<JAPanoViewDelegate>
{
    JAPanoView *viewDown;
    JAPanoView *viewUp;
    UIPanGestureRecognizer *_panIt;
}
@end
