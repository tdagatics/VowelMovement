//
//  main.m
//  VowelMovement
//
//  Created by Anthony Dagati on 10/3/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSArray *originalStrings = [[NSMutableArray alloc] init];
        originalStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"The original strings are %@", originalStrings);
        NSMutableArray *devowelizedStrings = [[NSMutableArray alloc] init];
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
       
        // Declare the block variable
        //void (^devowelizer)(id, NSUInteger, BOOL *);
        ArrayEnumerationBlock devowelizer;
        
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            
            NSRange yRange = [string rangeOfString:@"y" options: NSCaseInsensitiveSearch];
            
            // Did I find a "y"?
            
            if (yRange.location != NSNotFound) {
                *stop = YES; // Prevent further iteration
                return; // Ends this iteration
            }
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            
            [devowelizedStrings addObject:newString];
        }; // End of block assignment
        
        // Iterate over the array with your block
        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"The devowelized string is %@", devowelizedStrings);
    }
    return 0;
}

