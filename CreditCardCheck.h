//
//  CreditCardCheck.h
//
//  Created by Dexter Ang on 02/01/2011.
//  Copyright 2011 Dexter Ang. All rights reserved.
//
//  License: The BSD License

#import <Foundation/Foundation.h>


@interface CreditCardCheck : NSObject {

}

+ (NSString *)cleanCreditCardNo:(NSString *)aCreditCardNo;
+ (NSString *)majorIndustryOf:(NSString *)aCreditCardNo;
+ (NSString *)issuerOf:(NSString *)aCreditCardNo;
+ (int)luhnCheckOf:(NSString *)aCreditCardNo;
+ (BOOL)validityOf:(int)aLuhnNo;

/* Sample credit card numbers that validate for testing:
 American Express	3400 0000 0000 009
 Carte Blanche		3000 0000 0000 04
 Discover			6011 0000 0000 0004
 Diner's Club		3000 0000 0000 04
 enRoute			2014 0000 0000 009
 JCB				2131 0000 0000 0008
 MasterCard			5500 0000 0000 0004
 Solo				6334 0000 0000 0004
 Switch				4903 0100 0000 0009
 Visa				4111 1111 1111 1111
 */

@end
