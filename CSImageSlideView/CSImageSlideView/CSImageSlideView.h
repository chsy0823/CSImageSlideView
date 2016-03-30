//
//  CSSlideImageView.h
//  CSImageSlideView
//
//  Created by SuhyongChoi on 2016. 3. 30..
//  Copyright © 2016년 elenore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSImageSlideContentsView.h"

#define TYPEPHOTO 0
#define TYPEBUTTON 1

#pragma mark - CSImageSlideView Delegate

@protocol CSImageSlideViewDelegate;

@interface CSImageSlideView : UIView {
    
    NSMutableArray *imageItemArray;
    NSMutableArray *currentItmes;
    NSMutableDictionary *defaultItem;
    NSInteger currentIndex;
}

- (void)setItemArray:(NSMutableArray*)array;
- (void)setInitial;

+ (Class)CSImageSlideContentsViewClass;

@property (nonatomic, weak) id<CSImageSlideViewDelegate>delegate;
@property (nonatomic, strong) CSImageSlideContentsView *contentsView;
@end

@protocol CSImageSlideViewDelegate <NSObject>

@optional

- (void)imageSlideView:(CSImageSlideView*)imageSlideView didSelectPhoto:(NSDictionary*)itemDict;

@end
