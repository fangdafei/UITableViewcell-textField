//
//  ViewController.m
//  UITableViewCell-textField
//
//  Created by HT178 on 2019/7/19.
//  Copyright © 2019 HT178. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "UITextField+indexPath.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define oneSchoolTag  0x111111
#define twoSchoolTag  0x222222

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)UITableView *tableView;
@property (nonatomic , strong)NSMutableArray *dataArray;

@property (nonatomic, strong) UIButton *completeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    [self initDatas];
    
}

- (void)initViews {
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.completeBtn];
}

- (void)initDatas {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark - notification

- (void)textFieldDidChanged:(NSNotification *)noti{
    // 数据源赋值
    UITextField *textField=noti.object;
    NSIndexPath *indexPath = textField.indexPath;
    
/*  多个textfield的话 对应textfield给model赋值
    if (textField.tag == oneSchoolTag) {
        wardModel.goalOne = [textField.text integerValue];
    }else if (textField.tag == twoSchoolTag) {
        wardModel.goalTwo = [textField.text integerValue];
    }
  */
    //一个textfield
    [self.dataArray replaceObjectAtIndex:indexPath.row withObject:textField.text];
}

#pragma marks - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Id = @"TableViewCellId";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    // 核心方法
    [cell loadData:[self.dataArray objectAtIndex:indexPath.row] andIndexPath:indexPath];
     return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - private

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.tableFooterView = [UIView new];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyBord)];
        [_tableView addGestureRecognizer:gesture];
    }
    return _tableView;
}

- (UIButton *)completeBtn{
    if (!_completeBtn) {
        _completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 260, (SCREEN_WIDTH - 200), 44)];
        [_completeBtn setTitle:@"打印数据源" forState:UIControlStateNormal];
        _completeBtn.backgroundColor = [UIColor cyanColor];
        [_completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_completeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _completeBtn;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        NSArray *array = @[@{@"k1":@"1",@"k2":@"2"},
                       @{@"k1":@"3",@"k2":@"4"}];
        
        _dataArray = [[NSMutableArray alloc]initWithArray:array];
    }
    return _dataArray;
}

- (void)btnClick {
    // 打印数据源
    NSLog(@"------%@",self.dataArray);
}


- (void)hiddenKeyBord{
    NSLog(@"要隐藏键盘了........1111111111111");
    [self.view endEditing:YES];
}



@end
