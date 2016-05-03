//
//  CSSlideImageView.m
//  CSImageSlideView
//
//  Created by SuhyongChoi on 2016. 3. 30..
//  Copyright © 2016년 elenore. All rights reserved.
//

#import "CSImageSlideView.h"
#define LEFT 0
#define RIGHT 1
#define IMAGECOUNT 3

@implementation CSImageSlideView

- (id)initWithFrame:(CGRect)frame {
    NSLog(@"init with frame");
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self setInitial];
    }
    
    return self;
}

- (void)setInitial {
    
    currentIndex = 0;
    imageItemArray = [NSMutableArray array];
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    
    self.contentsView = [[[self class] CSImageSlideContentsViewClass] view];
    [self.contentsView setFrame:frame];
    
    for(UIButton *button in self.contentsView.clickBtns) {
        [button addTarget:self action:@selector(clickMove:) forControlEvents:UIControlEventTouchUpInside];
    }
    for(UIButton *button in self.contentsView.imageBtns) {
        [button addTarget:self action:@selector(clickImage:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self addSubview:self.contentsView];
    
    UIImage *updatePhoto = [UIImage imageNamed:@"uploadImg"];
    NSNumber *type = [NSNumber numberWithInt:TYPEBUTTON];
    
    defaultItem = [NSMutableDictionary dictionary];
    
    [defaultItem setObject:updatePhoto forKey:@"imageItem"];
    [defaultItem setObject:type forKey:@"itemType"];
    
    [imageItemArray addObject:defaultItem];
    [imageItemArray addObject:defaultItem];
    [imageItemArray addObject:defaultItem];
    
    [self setItemImages];
}

- (void)setItemArray:(NSMutableArray*)array {
    
    imageItemArray = [array mutableCopy];
    currentIndex = 0;
    
    [imageItemArray addObject:defaultItem];
    
    [self setItemImages];
}

- (void)setItemImages {
    
    NSInteger count = [imageItemArray count];
    NSInteger prefix = IMAGECOUNT*currentIndex;
    
    for(UIImageView *imageView in self.contentsView.imageViewCollection) {
        
        [imageView setImage:nil];
        
        if(prefix < count) {
            
            NSDictionary *dict = (NSDictionary*)[imageItemArray objectAtIndex:prefix];
            UIImage *image;
            
            //set static image
            if([dict objectForKey:@"imageItem"]) {
                
                image = (UIImage*)[dict objectForKey:@"imageItem"];
                [imageView setImage:image];
            }
            else {
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    
                    //set profile
                    NSURL *url = [NSURL URLWithString:[dict objectForKey:@"imageUrl"]];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    
                    dispatch_async(dispatch_get_main_queue(), ^ {
                        [imageView setImage:[[UIImage alloc]initWithData:data]];
                    });
                });
            }
            
            prefix++;
        }
    }
}

- (void)performTransition:(NSInteger)position
{
    currentIndex++;
    
    if([imageItemArray count] <= IMAGECOUNT*currentIndex){
        currentIndex=0;
    }
    
    [self setItemImages];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.75;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    transition.type =kCATransitionPush;
    transition.subtype = position == LEFT ? kCATransitionFromLeft : kCATransitionFromRight;
    
    transition.delegate = self;
    
    [self.contentsView.contentsView.layer addAnimation:transition forKey:nil];
    
}
- (void)clickImage:(UIButton*)button {
    
    NSInteger prefix = IMAGECOUNT*currentIndex+button.tag;
    
    NSDictionary *dict = (NSDictionary*)[imageItemArray objectAtIndex:prefix];
    
    [self.delegate imageSlideView:self didSelectPhoto:dict];
}

- (void)clickMove:(UIButton*)button {
    
    [self performTransition:button.tag];
}

+ (Class)CSImageSlideContentsViewClass {
    
    return [CSImageSlideContentsView class];
}

@end
