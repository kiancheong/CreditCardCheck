CreditCardCheck
===============

CreditCardCheck is a Cocoa/Objective-C class to check for the validity of credit card numbers using the Luhn Algorithm.

Methods
-------

All methods are Class methods. Just import the header file and you're good to go.

`+ (NSString *)cleanCreditCardNo:(NSString *)aCreditCardNo;` - Returns a cleaned up credit card no (ie. no spaces, dashes, etc.).

`+ (NSString *)majorIndustryOf:(NSString *)aCreditCardNo;` - Returns the major industry of the credit card. Based on the first digit.

`+ (NSString *)issuerOf:(NSString *)aCreditCardNo;` - Returns the issuer of the credit card.

`+ (int)luhnCheckOf:(NSString *)aCreditCardNo;` - Returns the computed no. based on the Luhn Algorithm. The last digit entered will always be assumed to be the check digit. Works with any length of numbers. So not really limited to credit card no.

`+ (BOOL)validityOf:(int)aLuhnNo;` - Just mod 10 the parameter. Returns YES if Luhn no. passed is divisible by 10.

Notes
-----

Known Issues
------------

1. `+ (NSString *)issuerOf:(NSString *)aCreditCardNo;` is not yet implemented. Looking for a complete up-to-date database of these.

Copyright & License
-------------------

Copyright (c) 2012 Dexter Ang

CreditCardCheck is released under the MIT license:

- http://www.opensource.org/licenses/MIT
