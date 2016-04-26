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
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;



//declare property of form validator
@property (strong, nonatomic) FormValidator *formValidator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    // self.addressTextField.placeholder = @"Address";
   //alternative way to set  in code rather than storyboard
    
    //create instance of formvalidator
    self.formValidator = [[FormValidator alloc]init];
    
    self.title = @"Validator";
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  
#pragma mark Name Validation
    if ([textField isEqual: self.nameTextField])
        //when user is working in name text field
        
            {
            if ([self.formValidator validateName:self.nameTextField.text])
             //when user input passes name validation (space between two strings)
                    {
                    [self.nameTextField resignFirstResponder];
                    //remove cursor from name field
                    [self.addressTextField becomeFirstResponder];
                    //place cursor on address field
                    self.nameTextField.backgroundColor = [UIColor greenColor];
                    //change color to show user input is valid

                    return YES;
                    }
            return [self.formValidator validateName: self.nameTextField.text];
            //
            }
    
#pragma mark Address Validation
    else if ([textField isEqual:self.addressTextField])
            {
            if ([self.formValidator isValidAddress:self.addressTextField.text])
                    {
                    [self.addressTextField resignFirstResponder];
                    [self.cityTextField becomeFirstResponder];
                    self.addressTextField.backgroundColor = [UIColor greenColor];
                    return YES;
                    }
            return [self.formValidator isValidAddress: self.addressTextField.text];
            }
    
#pragma mark City Validation
    else if ([textField isEqual:self.cityTextField])
    {
        if ([self.formValidator isCity:self.cityTextField.text])
        {
            [self.cityTextField resignFirstResponder];
            [self.stateTextField becomeFirstResponder];
            self.cityTextField.backgroundColor = [UIColor greenColor];
            return YES;
        }
        return [self.formValidator isCity: self.cityTextField.text];
    }
    
#pragma mark State Validation
    else if ([textField isEqual:self.stateTextField])
    {
        if ([self.formValidator validateName:self.stateTextField.text])
        {
            [self.stateTextField resignFirstResponder];
            [self.zipTextField becomeFirstResponder];
            self.stateTextField.backgroundColor = [UIColor greenColor];
            return YES;
        }
        return [self.formValidator isState: self.stateTextField.text];
    }

#pragma mark Zip Code Validation
    else if ([textField isEqual:self.zipTextField])
        {
        if ([self.formValidator isZipCode:self.zipTextField.text])
                {
                [self.zipTextField resignFirstResponder];
                [self.phoneTextField becomeFirstResponder];
                self.zipTextField.backgroundColor = [UIColor greenColor];
                return YES;
                }
            return [self.formValidator isZipCode: self.zipTextField.text];
        }
            
#pragma mark Phone Number Validation
        else if ([textField isEqual:self.phoneTextField])
        {
            if ([self.formValidator isPhone:self.phoneTextField.text])
            {
                [self.phoneTextField resignFirstResponder];
                self.phoneTextField.backgroundColor = [UIColor greenColor];
                return YES;
            }
            return [self.formValidator isPhone: self.phoneTextField.text];
        }
        else
    
    
        return NO;
    }


@end
