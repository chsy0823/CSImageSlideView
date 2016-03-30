//
//  CSImageSlideViewContentsView.h
//  CSImageSlideView
//
//  Created by SuhyongChoi on 2016. 3. 30..
//  Copyright © 2016년 elenore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSImageSlideContentsView : UIView

@property (nonatomic,strong) IBOutletCollection(id) NSArray *clickBtns;
@property (nonatomic,strong) IBOutletCollection(id) NSArray *imageBtns;

@property (nonatomic,strong) IBOutletCollection(id)NSArray *imageViewCollection;
@property (nonatomic,weak) IBOutlet UIView *contentsView;

+ (id)view;

@end
