//
//  HDClassRoomCell.m
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDClassRoomCell.h"

@interface HDClassRoomCell ()

@property (nonatomic, strong) UIImageView *roomImage;

@property (nonatomic, strong) NSTextView *roomName;

@property (nonatomic, strong) NSTextView *teacherName;

@property (nonatomic, strong) NSTextView *joinRoom;

@end

@implementation HDClassRoomCell

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    [self createView];
    self.backgroundColor = [UIColor whiteColor];
    return self;
}


- (void)createView {
    self.roomImage = UIImageView.new;
    self.roomImage.layer.cornerRadius = 5;
    self.roomImage.frame = CGRectMake(10, 10, 80, 80);
    self.roomImage.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.roomImage];
    
    self.roomName = NSTextView.new;
    self.roomName.editable = NO;
    self.roomName.backgroundColor = [UIColor whiteColor];
    self.roomName.textColor = [UIColor blackColor];
    self.roomName.frame = CGRectMake(90 + 10, 10, 350, 30);
    [self addSubview:self.roomName];
    
    self.teacherName = NSTextView.new;
    self.teacherName.editable = NO;
    self.teacherName.backgroundColor = [UIColor whiteColor];
    self.teacherName.textColor = [UIColor blackColor];
    self.teacherName.frame = CGRectMake(90 + 10, 50, 350, 30);
    [self addSubview:self.teacherName];
    
    self.joinRoom = NSTextView.new;
    self.joinRoom.editable = NO;
    self.joinRoom.backgroundColor = [UIColor whiteColor];
    self.joinRoom.textColor = [UIColor blackColor];
    self.joinRoom.frame = CGRectMake(350 - 120, 35, 100, 30);
    [self addSubview:self.joinRoom];
    
    CALayer *line = CALayer.new;
    line.frame = CGRectMake(90 + 10, 99, 350 - 100, 1);
    line.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:line];
}
- (void)setModel:(HDRoomModel *)model {
    _model = model;
    
    [self.roomImage sd_setImageWithURL:URL(model.cover)];
    self.roomName.string = [NSString stringWithFormat:@"roomId : %zd",model.roomId];
    self.teacherName.string = [NSString stringWithFormat:@"老师名字 : %@",model.teacher];
}

@end
