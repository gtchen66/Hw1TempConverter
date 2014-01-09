//
//  TempertureViewController.m
//  Hw1TempConverter
//
//  Created by George Chen on 1/9/14.
//  Copyright (c) 2014 George Chen. All rights reserved.
//

#import "TempertureViewController.h"

@interface TempertureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fTextField;
@property (weak, nonatomic) IBOutlet UITextField *cTextField;

// fromFarenheit is YES if editing in Fahrenheit, NO if not.
@property (nonatomic) BOOL fromFarenheit;

- (IBAction)onFEditingDidBegin:(id)sender;
- (IBAction)onCEditingDidBegin:(id)sender;
- (IBAction)onConvertTouchDown:(id)sender;

- (void) updateTemperature;

@end

@implementation TempertureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cTextField.delegate = self;
    self.fTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"inside my textFieldShouldReturn");
    [self.view endEditing:YES];
    [self updateTemperature];
    return YES;
}

- (IBAction)onFEditingDidBegin:(id)sender {
    self.fromFarenheit = YES;
    NSLog(@"Editing Farenheit");
}

- (IBAction)onCEditingDidBegin:(id)sender {
    self.fromFarenheit = NO;
    NSLog(@"Editing Celsius");
}

- (IBAction)onConvertTouchDown:(id)sender {
    [self.view endEditing:YES];
    [self updateTemperature];
}

- (void) updateTemperature {
    float degreeC;
    float degreeF;
    
    if (self.fromFarenheit == YES) {
        degreeF = [self.fTextField.text floatValue];
        degreeC = (degreeF - 32)*5/9;
    }
    else {
        degreeC = [self.cTextField.text floatValue];
        degreeF = (degreeC*9/5) + 32;
    }
    self.cTextField.text = [NSString stringWithFormat:@"%.1f", degreeC];
    self.fTextField.text = [NSString stringWithFormat:@"%.1f", degreeF];
    
}
@end
