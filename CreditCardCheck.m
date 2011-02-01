//
//  CreditCardCheck.m
//
//  Created by Dexter Ang on 02/01/2011.
//  Copyright 2011 Dexter Ang. All rights reserved.
//
//  License: GPL v.3. If you need some other license, just ask me.

#import "CreditCardCheck.h"


@implementation CreditCardCheck

// Returns a string of integers, without dashes, spaces, etc.
+ (NSString *)cleanCreditCardNo:(NSString *)aCreditCardNo {
	// Efficient way found at:
	// http://stackoverflow.com/questions/1129521/remove-all-but-numbers-from-nsstring/1426819#1426819
	return [[aCreditCardNo componentsSeparatedByCharactersInSet:
				[[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
				componentsJoinedByString:@""];
}

// Returns the industry of the credit card issuer based on the
// Major Industry Identifier (MII).
+ (NSString *)majorIndustryOf:(NSString *)aCreditCardNo {
	int int_c = 10; // Will return "Unknown/Invalid" by default.
	
	NSString *cleanCardNo = [self cleanCreditCardNo:aCreditCardNo];
	
	NSArray *MII = [NSArray arrayWithObjects:
						 @"ISO/TC 68 and other future industry assignments",
						 @"Airlines",
						 @"Airlines and other future industry assignments",
						 @"Travel and entertainment and banking/financial",
						 @"Banking and financial",
						 @"Banking and financial",
						 @"Merchandising and banking/financial",
						 @"Petroleum and other future industry assignments",
						 @"Healthcare, telecommunications and other future industry assignments",
						 @"National assignment",
						 @"Unknown/Invalid", nil];

	if ([cleanCardNo length] != 0) {
		// Get the first digit since that's all that matters for MII.
		int_c = [[NSString stringWithFormat:@"%c", [cleanCardNo characterAtIndex:0]] intValue];
	}
	
	return [MII objectAtIndex:int_c];	
}

// Returns the name of the credit card issuer based on the
// Issuer Identification Number (IIN).
// NOTE: This may not be complete and will return "Unknown" if not found.
+ (NSString *)issuerOf:(NSString *)aCreditCardNo {
	// TODO
	
	// NOTES: Some well known ones are:
	// 34xxxx, 37xxxx - American Express
	// 4xxxxx - Visa
	// 51xxxx - 55xxxx - MasterCard
	// 6011xx - Discover
	
	return @"TODO";
}

// Based on the Luhn Algorithm. This method doubles every other digit, starting
// from the end, skipping the check digit. Then all digits are added.
// NOTE 1: When a doubled digit returns a 2-digit number, each digit is added
// separately.
// NOTE 2: Returns -1 if aCreditCardNo is empty.
+ (int)luhnCheckOf:(NSString *)aCreditCardNo {
	int nthChar = 1; // Used for tracking with nth digit we're on in the loop.
	int sum = 0;
	
	NSString *cleanCardNo = [self cleanCreditCardNo:aCreditCardNo];
	
	if ([cleanCardNo length] != 0) {
		// This for-loop goes from end to start.
		for (int i = [cleanCardNo length] - 1; i >= 0; i--) {
			int int_c = [[NSString stringWithFormat:@"%c", [cleanCardNo characterAtIndex:i]] intValue];
			
			if (nthChar % 2 == 0) {
				// Double every other digit starting from the 2nd from the end.
				int doubledValue = 0;
				doubledValue = int_c * 2;
				
				if (doubledValue >= 10) {
					// If 2-digit result, add each digit separately.
					// Adding 1 on the end always since maximum doubled digit will
					// always be 18 only (9 * 2).
					sum = sum + (doubledValue % 10) + 1;
				} else {
					// If 1-digit result, just add to the sum.
					sum = sum + doubledValue;
				}
				
			} else {
				// Otherwise, just add to the sum.
				sum = sum + int_c;
			}
			nthChar++;
		}
	} else {
		sum = -1;
	}
	
	return sum;
}

// If aLuhnNo is a number divisible by 10, then the Credit Card No.
// may be valid. Otherwise, it is definitely not valid.
+ (BOOL)validityOf:(int)aLuhnNo {
	return (aLuhnNo % 10 == 0);
}

@end
