#import "cool_places.h"

@implementation CoolPlacesNearMe

-(void) set_list_places : (Place *)place {
    if (place) {
        if (_list_places)
            [_list_places addObject : place];
        else {
            _list_places = [[NSMutableArray alloc] init];
            [_list_places addObject : place];
        }
    }
}

-(void) print_list {
    if (_list_places) {
        NSInteger i = 0;
        for (; i < [_list_places count]; i++) {
            id obj = [_list_places objectAtIndex:i];
            [obj print];
            NSLog(@"\n");
        }
    }
}

-(void) add_places_json {
    NSString *path = @"places.json";
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data) {
        NSError *error = nil;
        NSDictionary *json_dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (json_dict) {
            for (id place_dict in [json_dict objectForKey:@"candidates"]) {
                Place *temp = [Place alloc];
                temp = [temp init];
                [temp set_lat : [[[[place_dict objectForKey:@"geometry"]objectForKey:@"location"]objectForKey:@"lat"] floatValue]];
                [temp set_lng : [[[[place_dict objectForKey:@"geometry"]objectForKey:@"location"]objectForKey:@"lng"] floatValue]];
                [temp set_name : [place_dict objectForKey:@"name"]];
                [self set_list_places : temp];
            }
        }
    }
}

-(void) set_base_point {
    _base_point = [Place alloc];
    _base_point = [_base_point init];
    [_base_point set_name : @"Apriorit office on Vladimir Veliky 34B"];
    [_base_point set_lat : 48.471207];
    [_base_point set_lng : 35.038810];
}

-(void) set_radius : (CGFloat)rad {
    if (rad)
        _search_radius = rad;
}

-(NSMutableArray *) find_places_with_radius {
    if (_list_places) {
        NSMutableArray *found_places;
        found_places = [[NSMutableArray alloc] init];
        CGFloat const earth_rad = 6371;
        NSInteger i = 0;
        for (; i < [_list_places count]; i++) {
            id obj = [_list_places objectAtIndex:i];
            CGFloat sin1 = sin(([_base_point get_lat] - [obj get_lat]) / 2);
            CGFloat sin2 = sin(([_base_point get_lng] - [obj get_lng]) / 2);
            CGFloat radius = 2 * earth_rad * asin(sqrt(sin1 * sin1 + sin2 * sin2 * cos([_base_point get_lat]) * cos([obj get_lat])));
            if (_search_radius >= radius) {
                [found_places addObject : obj];
                NSLog(@"The name of place is: %@", [obj get_name]);
                NSLog(@"The radius is: %f", radius);
                NSLog(@"\n");
            }
        }
        return found_places;
    }
    return nil;
}

@end
