#import <Foundation/Foundation.h>
#import "place.h"

@interface CoolPlacesNearMe : NSObject {
    NSMutableArray *_list_places;
    Place *_base_point;
    CGFloat _search_radius;
}

-(void) set_list_places : (Place *)place;
-(void) print_list;
-(void) add_places_json;
-(void) set_base_point;
-(void) set_radius : (CGFloat)rad;
-(NSMutableArray *) find_places_with_radius;

@end