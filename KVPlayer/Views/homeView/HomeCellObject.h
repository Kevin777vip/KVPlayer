//
//  HomeCellObject.h
//  KVPlayer
//
//  Created by fb on 2018/5/22.
//

#import "NICellFactory.h"

@interface HomeCellObject : NICellObject
@property (nonatomic,copy) NSString *titleStr;
+(HomeCellObject*)tableViewCell;
@end
