//
//  MainViewController.m
//  KVPlayer
//
//  Created by fb on 2018/5/22.
//

#import "MainViewController.h"
#import <NICellFactory.h>
#import <NimbusModels.h>
#import "HomeCellObject.h"
#import "KVPlayerViewController.h"
#import <ReactiveObjC.h>
@interface MainViewController ()<UITableViewDelegate>
@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) NITableViewModel *mainTableModel;
@property (nonatomic,strong) NITableViewActions *mainTableActions;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configTableView];
    [self fetchData];
}

- (void)configUI {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)configTableView{
    _mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_mainTableView];
    _mainTableActions = [[NITableViewActions alloc]initWithTarget:self];
    _mainTableActions.tableViewCellSelectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)fetchData {
    NSMutableArray *contents = [[NSMutableArray alloc]init];
    
    HomeCellObject *homeObject = [HomeCellObject tableViewCell];
    [contents addObject:homeObject];
    @weakify(self);
    [_mainTableActions attachToObject:homeObject tapBlock:^BOOL(id object, id target, NSIndexPath *indexPath) {
        @strongify(self);
        NSLog(@"sssss");
        [self startPlayWithUrlStr:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
        return YES;
    }];
    
    _mainTableModel = [[NITableViewModel alloc]initWithSectionedArray:contents delegate:(id)[NICellFactory class]];
    _mainTableView.dataSource = _mainTableModel;
    _mainTableView.delegate = [_mainTableActions forwardingTo:self];
    [_mainTableView reloadData];
}

-(void)startPlayWithUrlStr:(NSString*)urlStr {
    KVPlayerViewController *playVC = [[KVPlayerViewController alloc]init];
    playVC.playUrlStr = urlStr;
    [self.navigationController pushViewController:playVC animated:YES];
}

#pragma mark - table delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellObject = [_mainTableModel objectAtIndexPath:indexPath];
    Class cellClass = nil;
    
    if ([cellObject respondsToSelector:@selector(cellClass)]) {
        cellClass = [cellObject cellClass];
    }
    
    if ([cellObject respondsToSelector:@selector(heightForObject:atIndexPath:tableView:)]) {
        return [cellClass heightForObject:cellObject atIndexPath:indexPath tableView:tableView];
    }
    return tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    return redView;
}



@end
