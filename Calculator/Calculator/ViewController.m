//
//  ViewController.m
//  Calculator
//
//  Created by Imam on 4/11/15.
//  Copyright (c) 2015 Imam. All rights reserved.
//

#import "ViewController.h"

#import "CalculatorModel.h"


@interface ViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringAnNumber;
@property(nonatomic, strong) CalculatorModel * calculatorModel;
@end

@implementation ViewController
@synthesize display= _display;
@synthesize userIsInTheMiddleOfEnteringAnNumber= _userIsInTheMiddleOfEnteringAnNumber;
@synthesize calculatorModel= _calculatorModel;
/*
 0. add the sythesize display= _display
 1. remove the template controller :D
 2. add button  an outlet digit pressed
    -return (IBAction) nothing but void return 
    - (id) any object can be pass on id , such a abstrack for this
  3. copy all the buttons digits to 0-9 
     this also connect the outlet
 4. change id --> UIButton *
 5. add a property for reduce 0 on front digits
 
 6. create logic 
 7 create model ..> calculatorModel
 8 all on *.h file is public and *.m is private
 
 ===========================================
 TIPS: click + option button to view help
 
 */


-(CalculatorModel *)calculatorModel
{
    if (!_calculatorModel ) _calculatorModel =[[CalculatorModel alloc]init];
    return _calculatorModel;
}


- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString * digit=[sender currentTitle];
    
 //   NSLog(@"button Pressed: [%@]",digit);
    /*
    // [self display ]== self.display
    UILabel * myDisplay= [self display];
    NSString * currentText= myDisplay.text ;//[myDisplay text];  // getter
    NSString * newTest=[currentText stringByAppendingString:digit];
    [myDisplay setText:newTest];    // setter
    
      can be simplify by bellow code
     */
    
    
   // self.display.text= [self.display.text stringByAppendingString:digit];
    
    
    
    if (self.userIsInTheMiddleOfEnteringAnNumber)
    {
        self.display.text=[self.display.text stringByAppendingString:digit];
    }
    else{
        self.display.text=digit;
        self.userIsInTheMiddleOfEnteringAnNumber=YES;
    }
    
    
    
}
- (IBAction)operationPressed:(UIButton *)sender {
    
   // NSString * stringSender= [sender currentTitle];
 //     NSLog(@"operation Pressed: [%@]",stringSender );
    if (self.userIsInTheMiddleOfEnteringAnNumber)
        [self calcuEnter];
    
    double result= [self.calculatorModel performOperation:sender.currentTitle ];
       NSString * resultString= [NSString stringWithFormat:@"%g", result];
    self.display.text=resultString;
}


- (IBAction)calcuEnter {
    //double labelDouble= [self.display.text doubleValue];
    
    
   // NSLog(@"Enter  Pressed: [%g]",labelDouble );
     [self.calculatorModel pushOperand:[self.display.text doubleValue]];
     self.userIsInTheMiddleOfEnteringAnNumber=NO;
    

}

- (IBAction)calcuReset {
    
    [self.calculatorModel resetStack];
    self.display.text=@"0";
    
}


@end
