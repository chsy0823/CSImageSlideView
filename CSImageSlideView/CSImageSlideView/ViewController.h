//
//  ViewController.h
//  CSImageSlideView
//
//  Created by SuhyongChoi on 2016. 3. 30..
//  Copyright © 2016년 elenore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSImageSlideView.h"

@interface ViewController : UIViewController {
    NSMutableArray *tempArray;
}

@property (nonatomic,weak) IBOutlet CSImageSlideView *imageSlideView1;
@property (nonatomic,weak) IBOutlet CSImageSlideView *imageSlideView2;

@end

