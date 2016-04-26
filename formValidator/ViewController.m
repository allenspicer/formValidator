//
//  ViewController.m
//  formValidator
//
//  Created by Allen Spicer on 4/26/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController () <UITextFieldDelegate> 

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *addressTextField;

@property (weak, nonatomic) IBOutlet UITextField *zipTextField;



//declare property of form validator
@property (strong, nonatomic) FormValidator *formValidator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.addressTextField.placeholder = @"Address";
    
    //create instance of formvalidator
    self.formValidator = [[FormValidator alloc]init];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual: self.nameTextField]){
        if ([self.formValidator validateName:self.nameTextField.text]){
            [self.nameTextField resignFirstResponder];
            [self.addressTextField becomeFirstResponder];
            return YES;
        }
        return [self.formValidator validateName: self.nameTextField.text];
    }else if ([textField isEqual:self.addressTextField]){
        return [self.formValidator isValidAddress: self.addressTextField.text];
    }else if ([textField isEqual:self.zipTextField]){
        return [self.formValidator isZipCode: self.zipTextField.text];
        
        }
        return NO;
    }


@end
