//
//  HomeTableViewCell.m
//  KVPlayer
//
//  Created by fb on 2018/5/22.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

+(CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    return 60;
}


-(BOOL)shouldUpdateCellWithObject:(id)object {
    self.contentView.backgroundColor = [UIColor greenColor];
    return YES;
}

@end
