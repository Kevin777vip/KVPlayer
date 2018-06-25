//
//  HomeTableViewCell.m
//  KVPlayer
//
//  Created by fb on 2018/5/22.
//

#import "HomeTableViewCell.h"
#import "HomeCellObject.h"
@interface HomeTableViewCell()
@property (nonatomic,strong) UILabel *titleLabel;
@end
@implementation HomeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KV_SCREEN_WIDTH, 60)];
    _titleLabel.backgroundColor = [UIColor lightGrayColor];
    _titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_titleLabel];
}

+(CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    return 60;
}


-(BOOL)shouldUpdateCellWithObject:(id)object {
//    self.contentView.backgroundColor = [UIColor greenColor];
    HomeCellObject *cellObject = (HomeCellObject*)object;
    if (cellObject.titleStr.length>0) {
        _titleLabel.text = cellObject.titleStr;
    }
    return YES;
}

@end
