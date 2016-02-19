//
//  ValidationHelper.h
//  ServicesMen
//


#import <sys/socket.h>
#import <netinet/in.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface ValidationHelper : NSObject
{
    
}

+ (BOOL)isEmpty:(NSString*)inputString;
+ (BOOL)isNumeric:(NSString*)inputString;
+ (BOOL)isFloat:(NSString*)inputString;
+ (BOOL)isAlphaNumeric:(NSString*)inputString;
+ (BOOL)isAlphabetOnly:(NSString*)inputString;
+ (BOOL)isAlphabetWithSpaceOnly:(NSString*)inputString;
+ (BOOL)validateEmail: (NSString *)emailString;

@end
