//
//  TableViewCell.m
//  UITableViewCell-textField
//
//  Created by HT178 on 2019/7/19.
//  Copyright © 2019 HT178. All rights reserved.
//

#define oneSchoolTag  0x111111
#define twoSchoolTag  0x222222

#import "TableViewCell.h"
#import "UITextField+indexPath.h"

@interface TableViewCell ()

@property(nonatomic,strong)UITextField       *oneSchoolTextF;//一本
@property(nonatomic,strong)UITextField       *twoSchoolTextF;//二本

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initViews];
    }
    
    return self;
}

- (void)initViews  {
    [self.contentView addSubview:self.oneSchoolTextF];
    self.oneSchoolTextF.frame = CGRectMake(20, 0, 100, 40);
    
    //[self.contentView addSubview:self.twoSchoolTextF];
    //self.twoSchoolTextF.frame = CGRectMake(150, 0, 100, 40);
    
}

- (void)loadData:(NSDictionary *)dataString andIndexPath:(NSIndexPath *)indexPath {
    self.oneSchoolTextF.text = [dataString objectForKey:@"k1"];
    self.twoSchoolTextF.text = [dataString objectForKey:@"k2"];
    self.oneSchoolTextF.indexPath = indexPath;
    //self.twoSchoolTextF.indexPath = indexPath;
    
}


- (UITextField *)oneSchoolTextF {
    if (!_oneSchoolTextF) {
        _oneSchoolTextF = [[UITextField alloc] init];
        _oneSchoolTextF.tag = oneSchoolTag;
        _oneSchoolTextF.keyboardType = UIKeyboardTypeNumberPad;
        _oneSchoolTextF.borderStyle = UITextBorderStyleRoundedRect;
        _oneSchoolTextF.text = @"";
        _oneSchoolTextF.textAlignment = NSTextAlignmentCenter;
    }
    return _oneSchoolTextF;
}

- (UITextField *)twoSchoolTextF {
    if (!_twoSchoolTextF) {
        _twoSchoolTextF = [[UITextField alloc] init];
        _twoSchoolTextF.tag = twoSchoolTag;
        _twoSchoolTextF.keyboardType = UIKeyboardTypeNumberPad;
        _twoSchoolTextF.borderStyle = UITextBorderStyleRoundedRect;
        _twoSchoolTextF.text = @"";
        _twoSchoolTextF.textAlignment = NSTextAlignmentCenter;
    }
    return _twoSchoolTextF;
}





@end
