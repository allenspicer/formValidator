//
//  FormValidator.h
//  formValidator
//
//  Created by Allen Spicer on 4/26/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValidator : NSObject

-(BOOL) validateName:(NSString*)nameString;

-(BOOL) isValidAddress:(NSString*)addressString;

-(BOOL) isCity:(NSString*)cityString;

-(BOOL) isState:(NSString*)stateString;

-(BOOL) isZipCode:(NSString*)zipString;

-(BOOL) isPhone:(NSString*)phoneString;


@end
