//
//  KVPlayerViewController.m
//  KVPlayer
//
//  Created by fb on 2018/5/23.
//

#import "KVPlayerViewController.h"
#import <ZFPlayer.h>

@interface KVPlayerViewController ()<ZFPlayerDelegate>
@property (nonatomic,strong) ZFPlayerView *playerView;
@end

@implementation KVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpPlayer];
}

-(void)setUpPlayer {
    _playerView = [[ZFPlayerView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_playerView];
    
    ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc]init];
    ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
    playerModel.fatherView = self.view;
    playerModel.videoURL = [NSURL URLWithString:_playUrlStr];
    [_playerView playerControlView:controlView playerModel:playerModel];
    self.playerView.delegate = self;
    [self.playerView autoPlayTheVideo];
}



@end
