//
//  ViewController.m
//  Tipster
//
//  Created by Sarah Embry on 6/26/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_billField becomeFirstResponder];
    // Do any additional setup after loading the view, typically from a nib.
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
     // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
//    NSLog(@"Hello");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
//convert text in bill field to a number stored to the double "bill"
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.18), @(0.2)];
    
    //the doubleValue ] is similar to calling .doubleValue
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = tip + bill;
    
    self.tipLabel.text = [NSString stringWithFormat: @"$%.2f",tip];
    self.totalLabel.text =[NSString stringWithFormat:@"$%.2f",total];
}
- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
//        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y +30, self.billField.frame.size.width, self.billField.frame.size.height);
        
        //total label greys out
        self.totalLabel.alpha = 0.2;
    }];
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    [UIView animateWithDuration:0.2 animations:^{
        //self.billField.frame = newFrame;
        
        //total label reappears
       self.totalLabel.alpha = 1;
    }];
    
}

@end
