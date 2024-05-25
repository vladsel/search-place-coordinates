#import "place.h"

@implementation Place

-(void) set_name : (NSString *)name {
    if (name) {
        [name retain];
        [_name release];
        _name = [[NSString alloc] initWithString : name];
    }
}

-(void) set_lat : (CGFloat)lat {
    if (lat)
        _lat = lat;
}

-(void) set_lng : (CGFloat)lng {
    if (lng)
        _lng = lng;
}

-(void) print {
    NSLog (@"name is: %@", _name);
    NSLog (@"lat is: %f", _lat);
    NSLog (@"lng is: %f", _lng);
}

-(NSString *) get_name {
    return _name;
}

-(CGFloat) get_lat {
    return _lat;
}

-(CGFloat) get_lng {
    return _lng;
}

@end