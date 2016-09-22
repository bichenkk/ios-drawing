//
//  CanvasView.m
//  Drawing
//
//  Created by KK Chen on 7/27/16.
//  Copyright © 2016 KK Chen. All rights reserved.
//

#import "CanvasView.h"

@interface CanvasView ()

@property (nonatomic, strong) UIBezierPath *bezierPath;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation CanvasView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    self.bezierPath = [UIBezierPath bezierPath];
    [self.bezierPath setLineWidth:5];
    
    self.shapeLayer = [CAShapeLayer layer];
    [self.shapeLayer setFillColor:[[UIColor clearColor]CGColor]];
    [self.shapeLayer setStrokeColor:[[UIColor blackColor]CGColor]];
    [self.shapeLayer setLineWidth:5];
    
    //kCALineCapRound|kCALineCapButt|kCALineCapSquare
    [self.shapeLayer setLineCap:kCALineCapSquare];
    //    [self.shapeLayer setStrokeStart:0.5];[0
    //    [self.shapeLayer setStrokeEnd:0.5];
    [self.layer addSublayer:self.shapeLayer];
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    [self.bezierPath moveToPoint:touchLocation];
    
    NSLog(@"BEGAN %f, %f",touchLocation.x, touchLocation.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    [self.bezierPath addLineToPoint:touchLocation];
    [self.shapeLayer setPath:[self.bezierPath CGPath]];
    
    NSLog(@"MOVED %f, %f",touchLocation.x, touchLocation.y);
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    NSLog(@"ENDED %f, %f",touchLocation.x, touchLocation.y);
}

@end
