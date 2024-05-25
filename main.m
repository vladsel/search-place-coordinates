#import <Foundation/Foundation.h>
#import "cool_places.h"

int main (int argc, const char * argv[]) {

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    CoolPlacesNearMe *b = [[CoolPlacesNearMe alloc] init];

    [b add_places_json];
    
    [b set_base_point];
    
    [b set_radius : 47.87];
    
    NSLog(@"The list of all places:\n\n");
    
    [b print_list];
    
    NSLog(@"The task to find places by radius was completed:\n\n");
    
    NSMutableArray *places_by_radius = [[NSMutableArray alloc] initWithArray : [b find_places_with_radius]];
    
    if (places_by_radius) {
        NSInteger i = 0;
        for (; i < [places_by_radius count]; i++) {
            id obj = [places_by_radius objectAtIndex:i];
            [obj print];
            NSLog(@"\n");
        }
    }
    
    [pool drain];
    
    return 0;
}
