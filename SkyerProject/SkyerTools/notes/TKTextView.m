//
//  TKTextView.m
//  TunKe
//
//  Created by nncb on 16/3/8.
//  Copyright © 2016年 南宁市超博科技 Co. Ltd. All rights reserved.
//

#import "TKTextView.h"

@interface TKTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation TKTextView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:NULL];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kTextDidChange) name:UITextViewTextDidChangeNotification object:NULL];
}

- (void)kTextDidChange {
    [self updatePlaceholderLabel];
}

- (void)updatePlaceholderLabel {
    if (self.text.length) {
        self.placeholderLabel.hidden = YES;
    } else {
        self.placeholderLabel.hidden = !_placeholder.length;
    }
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self updatePlaceholderLabel];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self updatePlaceholderLabel];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLabel.font = font;
    self.placeholderLabel.frame = [self placeholderLabelFrame];
}

- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset {
    [super setTextContainerInset:textContainerInset];
    self.placeholderLabel.frame = [self placeholderLabelFrame];
}

- (UILabel *)placeholderLabel {
    if (!_placeholderLabel && _placeholder.length) {
        _placeholderLabel = [[UILabel alloc] initWithFrame:[self placeholderLabelFrame]];
        _placeholderLabel.font = self.font;
        _placeholderLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_placeholderLabel];
    }
    return _placeholderLabel;
}

- (CGRect)placeholderLabelFrame {
    return CGRectMake(self.textContainerInset.left + 3, self.textContainerInset.top - 1, [self placeholderLabelWidth] - 6, [self placeholderLabelHeight]);
}

- (CGFloat)placeholderLabelHeight {
    CGFloat w = [self placeholderLabelWidth];
    CGSize size = CGSizeMake(w, 0);
    UIFont *font = self.font ? : [UIFont systemFontOfSize:14.];
    CGRect rect = [_placeholder boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
    return rect.size.height + 1;
}

- (CGFloat)placeholderLabelWidth {
    return CGRectGetWidth(self.bounds) - self.textContainerInset.left - self.textContainerInset.right;
}

@end






















