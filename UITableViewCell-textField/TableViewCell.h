//
//  TableViewCell.h
//  UITableViewCell-textField
//
//  Created by HT178 on 2019/7/19.
//  Copyright © 2019 HT178. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

- (void)loadData:(NSDictionary *)dataString andIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
