//
//  HDMainViewController.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/9.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDMainViewController.h"
#import "HDUserRoomListModel.h"
#import "HDClassRoomCell.h"
#import "HDClassRoomController.h"

@interface HDMainViewController ()<NSTableViewDelegate, NSTableViewDataSource>

@property (nonatomic, strong) HDView *leftView;

@property (nonatomic, strong) HDButton *headerBut;

@property (nonatomic, strong) HDButton *listBut;

@property (nonatomic, strong) HDTableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation HDMainViewController

///< 不会初始化View
- (void)loadView {
    self.view = [[NSView alloc]initWithFrame:NSMakeRect(0, 0, 400, 700)];
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor yellowColor].CGColor;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
    
    [self loadData];
}

- (void)createView {
    self.dataSource = [NSMutableArray array];
    
    self.leftView = [[HDView alloc]initWithFrame:NSMakeRect(0, 0, 50, self.view.height)];
    self.leftView.backgroundColor = [NSColor lightGrayColor];
    [self.view addSubview:self.leftView];
    
    self.headerBut = HDButton.new;
    self.headerBut.frame = NSMakeRect(10, self.view.height - 50 - 30, 30, 30);
    [self.headerBut sd_setImageWithURL:URL([HDAccountTool account].headImg)];
    [self.leftView addSubview:self.headerBut];
    
    self.listBut = HDButton.new;
    self.listBut.frame = NSMakeRect(10, self.view.height - 50 - 30 - 50 - 30, 30, 30);
    self.listBut.image = [NSImage imageNamed:@"weixinliaotian"];
    [self.leftView addSubview:self.listBut];
    
    
    self.tableView = [[HDTableView alloc] initWithFrame:CGRectMake(50, 0, self.view.width - 50, self.view.height)];
    self.tableView.backgroundColor = [NSColor whiteColor];
    NSTableColumn *column1 = [[NSTableColumn alloc] initWithIdentifier:@"columnFrist"];
    [column1 setWidth:self.view.width - 50];
    [self.tableView addTableColumn:column1];

    self.tableView.focusRingType = NSFocusRingTypeNone;
    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleRegular;
    self.tableView.headerView.frame = NSZeroRect;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    
    NSScrollView *tableContainerView = [[NSScrollView alloc] initWithFrame:CGRectMake(50, 0, self.view.width - 50, self.view.height)];
    tableContainerView.backgroundColor = [NSColor redColor];
    
    [tableContainerView setDocumentView:self.tableView];
    
    [tableContainerView setDrawsBackground:NO];//不画背景（背景默认画成白色）
    
    [tableContainerView setHasVerticalScroller:YES];//有垂直滚动条
    
    tableContainerView.autohidesScrollers = YES;//自动隐藏滚动条（滚动的时候出现）
    
    [self.view addSubview:tableContainerView];
}

#pragma mark - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.dataSource.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    HDClassRoomCell *cell = [tableView makeViewWithIdentifier:@"HDClassRoomCell" owner:self];
    if (!cell) {
        cell = [[HDClassRoomCell alloc]init];
        cell.identifier = @"HDClassRoomCell";
    }
    cell.model = self.dataSource[row];
    cell.row = row;
    return cell;
}

//选中的响应
- (void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    HDClassRoomCell *cell = notification.object;
    HDClassRoomController *vc = HDClassRoomController.new;
    [self presentViewControllerAsModalWindow:vc];
}

- (void)loadData {
    [[HDHttpManager sharedInstance] GET:kGetUserRoomList dict:@{} succeed:^(id  _Nonnull data) {
        HDUserRoomListModel *model = [HDUserRoomListModel yy_modelWithJSON:data];
        [self.dataSource addObjectsFromArray:model.roomList];
        [self.tableView reloadData];
    } failure:^(NSString * _Nonnull errorMsg) {
        
    }];
}



@end
