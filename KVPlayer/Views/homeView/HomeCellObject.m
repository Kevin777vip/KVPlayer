//
//  HomeCellObject.m
//  KVPlayer
//
//  Created by fb on 2018/5/22.
//

#import "HomeCellObject.h"
#import "HomeTableViewCell.h"
@implementation HomeCellObject
+(HomeCellObject*)tableViewCell {
    return [HomeCellObject objectWithCellClass:[HomeTableViewCell class]];
}
@end
