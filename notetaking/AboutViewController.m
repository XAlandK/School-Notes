//
//  AboutViewController.m
//  School Notes
//
//  Created by Aland Kawa on 3/28/16.
//  Copyright © 2016 David Haber. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()
- (IBAction)closeButtonTapped:(UIButton *)sender;
- (IBAction)AlandKawaTwitter:(UIButton *)sender;
- (IBAction)donateButtonTapped:(UIButton *)sender;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)closeButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)AlandKawaTwitter:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=Aland_Kawa"]];
}

- (IBAction)donateButtonTapped:(UIButton *)sender {
    UIAlertController *donate = [UIAlertController alertControllerWithTitle:@"PayPal E-mail:\nxalandk@yahoo.com" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OKButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [donate addAction:OKButton];
    [self presentViewController:donate animated:YES completion:nil];
    
}
@end
