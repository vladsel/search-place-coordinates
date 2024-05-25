#import <Foundation/Foundation.h>

@interface Place : NSObject {
    NSString *_name;
    CGFloat _lat;
    CGFloat _lng;
}

-(void) set_name : (NSString *)name;
-(void) set_lat : (CGFloat)lat;
-(void) set_lng : (CGFloat)lng;
-(void) print;
-(NSString *) get_name;
-(CGFloat) get_lat;
-(CGFloat) get_lng;

@end