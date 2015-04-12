//
//  CalculatorModel.h
//  Calculator
//
//  Created by Imam on 4/11/15.
//  Copyright (c) 2015 Imam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject


-(void)pushOperand:(double )operand;
-(double)performOperation:(NSString *)operation;
-(void)resetStack;


// make API for the model

@property(readonly) id program;

+(double)runProgram:(id)program;
+(NSString *)decriptionOfProgram:(id)program;


@end
