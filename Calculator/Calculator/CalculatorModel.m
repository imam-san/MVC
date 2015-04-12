//
//  CalculatorModel.m
//  Calculator
//
//  Created by Imam on 4/11/15.
//  Copyright (c) 2015 Imam. All rights reserved.
//

#import "CalculatorModel.h"


@interface CalculatorModel()
@property (nonatomic, strong)NSMutableArray *programStack;
@end

@implementation CalculatorModel
@synthesize programStack= _programStack;


-(NSMutableArray* )programStack
{
    if (_programStack== nil )
        _programStack =[[NSMutableArray alloc]init ];
    return _programStack;
}
/*
-(void )setOperandStack:(NSMutableArray *)operandStack {
    _operandStack= operandStack;
}
*/


-(void)pushOperand:(double )operand
{
    /*
    NSNumber * operandObject=[NSNumber numberWithDouble:operand];
    [self.operationStack addObject:operandObject];
    =======================
     can be simplify by bellow code
     */
    NSLog(@"Push Operand= %g",operand);
    
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
    
}
/*
-(double) popOperand
{
    NSNumber *operandObject= [self.operandStack lastObject];
    
    if (operandObject!=nil) [self.operandStack removeLastObject];
    //[self.operationStack removeLastObject]
    
    return [operandObject doubleValue];
    
}
*/
-(double)performOperation:(NSString *)operation
{  double result=0;
    
    // calculator result
    
    [self.programStack addObject:operation];
    result=[CalculatorModel runProgram: self.program];
    return result;
}

-(id)program
{
    return [self.programStack copy];
}


+(NSString *)decriptionOfProgram:(id)program
{
    return @"implement on program ";
}


+(double)popOperandOfStack: (NSMutableArray *)stack

{
    double result=0;
//    NSUInteger * count=  [stack count];
   //  NSLog(@"top  Number stack: [%lu]",(unsigned long)count  );
    
    id topOfStack=[stack lastObject];
    if(topOfStack)[stack removeLastObject];
    if ([topOfStack isKindOfClass:[NSNumber class]])
         {
             result =[topOfStack doubleValue];
             NSLog(@"top  Number stack: [%g]",result );

         }
    else if ([topOfStack isKindOfClass:[NSString class]]){
        
        NSString *operation=topOfStack;
         if ([operation isEqual:@"+"])
        {
            result = [self popOperandOfStack:stack]+ [self popOperandOfStack:stack];
            
        } else if ([@"*" isEqualToString:operation])
        {
            result= [self popOperandOfStack:stack ] * [self popOperandOfStack:stack];
            
        }
        else if ([@"-" isEqualToString:operation])
        {
            double subrahend=[self popOperandOfStack:stack];
            result= [self popOperandOfStack:stack ] - subrahend;
            
        }
        else if ([@"/" isEqualToString:operation])
        {
            double divisor=[self popOperandOfStack:stack];
            result= [self popOperandOfStack:stack ]/divisor;
        }
        
        NSLog(@"top stack:%@== [%g]",operation,result );
        
        

    }
    return result;
}

+(double)runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]])
    {
        stack=[program mutableCopy];
    }
    
  return    [self popOperandOfStack:stack];
    
}

-(void)resetStack
{
    [self.programStack removeAllObjects];
}

@end
