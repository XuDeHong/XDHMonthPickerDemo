//
//  ViewController.m
//  XDHMonthPickerDemo
//
//  Created by 许德鸿 on 16/8/21.
//  Copyright © 2016年 XuDeHong. All rights reserved.
//

#import "ViewController.h"
#import "MonthPickerViewController.h"

@interface ViewController () <MonthPickerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *result;
@property (strong,nonatomic) MonthPickerViewController *monthPickerViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MonthPickerViewController *)monthPickerViewController
{
    if(!_monthPickerViewController)
    {
        _monthPickerViewController = [[MonthPickerViewController alloc] initWithNibName:@"MonthPickerViewController" bundle:nil];
    }
    
    return _monthPickerViewController;
}

- (IBAction)monthPickerBtnClick:(id)sender {
    //设置代理和当前年月
    self.monthPickerViewController.delegate = self;
    self.monthPickerViewController.currentYearAndMonth = self.result.text;
    //显示月份选择器
    [self.monthPickerViewController presentInParentViewController:self];
}

#pragma mark - MonthPickerViewControllerDelegate

-(void)chooseMonthAndYear:(NSString *)yearAndMonth
{
    //更新标签
    self.result.text = yearAndMonth;
}

@end
