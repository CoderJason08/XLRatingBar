//
//  XLRatingBar.m
//  XLRatingBar
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLRatingBar.h"

@interface XLRatingBar ()

@property (nonatomic, assign) CGFloat starWidth;
@property (nonatomic, assign) CGFloat topPadding;

@property (nonatomic, strong) UIImage *highlightImage;
@property (nonatomic, strong) UIImage *normalImage;

@property (nonatomic, strong) UIView *bottomView;

@end

@implementation XLRatingBar

- (void)drawRect:(CGRect)rect {

    for (int i = 0; i < _maxStar; i ++) {
        if (i < _currentStar) {
            [self.highlightImage drawInRect:CGRectMake(_starPadding + i * (_starPadding + _starWidth), _topPadding, _starWidth, _starWidth)];
        }else {
            [self.normalImage drawInRect:CGRectMake(_starPadding + i * (_starPadding + _starWidth), _topPadding, _starWidth, _starWidth)];
        }
    }
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}


- (void)setup {
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    if (_maxStar < 1) {
        _maxStar = 5;
    }
    
    if (_starPadding < 1) {
        _starPadding = 2.0f;
    }
    
    if (_currentStar < 0) {
        _currentStar = 0;
    }
    
    _enable = YES;
    
    _bottomView = [[UIView alloc] init];
    [self addSubview:_bottomView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.bottomView addGestureRecognizer:tap];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.bottomView addGestureRecognizer:pan];
}

- (void)layoutSubviews {
    _starWidth = (self.frame.size.width - (_maxStar + 1) * _starPadding) / _maxStar;
    _starWidth = (_starWidth > CGRectGetHeight(self.frame)) ? CGRectGetHeight(self.frame) : _starWidth;
    _topPadding = (CGRectGetHeight(self.frame) - _starWidth) / 2;
    _bottomView.frame = CGRectMake(0, _topPadding, self.frame.size.width, _starWidth);
    [self setNeedsDisplay];
    
}

#pragma mark - Action

- (void)tapAction:(UITapGestureRecognizer *)tap {
    if (self.isEnable) {
        CGPoint location = [tap locationInView:self.bottomView];
        if (location.x > _starPadding) {
            self.currentStar = (location.x - _starPadding) / (_starWidth + _starPadding) + 1;
            [self setNeedsDisplay];
        }
    }
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    if (self.isEnable) {
        CGPoint location = [pan locationInView:self.bottomView];
        if (location.x > _starPadding) {
            self.currentStar = (location.x - _starPadding) / (_starWidth + _starPadding) + 1;
            [self setNeedsDisplay];
        }
    }
}

#pragma mark - Getter & Setter

- (UIImage *)highlightImage {
    if (!_highlightImage) {
        self.highlightImage = [UIImage imageNamed:@"star_highlight"];
    }
    return _highlightImage;
}

- (UIImage *)normalImage {
    if (!_normalImage) {
        self.normalImage = [UIImage imageNamed:@"star_normal"];
    }
    return _normalImage;
}

- (void)setCurrentStar:(int)currentStar {
    _currentStar = currentStar;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self setNeedsDisplay];
}



@end
