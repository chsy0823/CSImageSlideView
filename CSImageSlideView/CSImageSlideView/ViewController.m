//
//  ViewController.m
//  CSImageSlideView
//
//  Created by SuhyongChoi on 2016. 3. 30..
//  Copyright © 2016년 elenore. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CSImageSlideViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageSlideView1.delegate = self;
    self.imageSlideView2.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self.imageSlideView1 setInitial];
    [self.imageSlideView2 setInitial];
    [self set];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}
//sample array set
- (void)set {
    
    tempArray = [NSMutableArray array];
    
    NSMutableDictionary *item1 = [NSMutableDictionary dictionary];
    UIImage *updatePhoto = [UIImage imageNamed:@"sampleImg1.png"];
    NSNumber *type = [NSNumber numberWithInt:0];
    
    [item1 setObject:updatePhoto forKey:@"imageItem"];
    [item1 setObject:type forKey:@"itemType"];
    
    NSMutableDictionary *item2 = [NSMutableDictionary dictionary];
    UIImage *updatePhoto2 = [UIImage imageNamed:@"sampleImg2.png"];
    NSNumber *type2 = [NSNumber numberWithInt:0];
    
    [item2 setObject:updatePhoto2 forKey:@"imageItem"];
    [item2 setObject:type2 forKey:@"itemType"];
    
    [tempArray addObject:item1];
    [tempArray addObject:item2];
    
    [self.imageSlideView1 setItemArray:tempArray];
}

#pragma mark -CSImageSlideView Delegate

- (void)imageSlideView:(CSImageSlideView*)imageSlideView didSelectPhoto:(NSDictionary*)itemDict {
    
    NSLog(@"image clicked");
    UIImage *image = (UIImage*)[itemDict objectForKey:@"imageItem"];
    NSNumber *type = (NSNumber*)[itemDict objectForKey:@"itemType"];
    
    if([type intValue] == TYPEPHOTO) {
        
    }
    //show image picker from album
    else {
        
    }   
}


@end
