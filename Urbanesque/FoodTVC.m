//
//  FoodTVC.m
//  Urbanesque
//
//  Created by Lauren Jaramillo on 8/19/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "FoodTVC.h"

@interface FoodTVC ()

@end

@implementation FoodTVC

- (void)getNearbyPlaces {
    NSLog(@"Lat is %f. Long is %f.", self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude); // debug
    [Foursquare2 searchVenuesNearByLatitude:@(self.currentLocation.coordinate.latitude) longitude:@(self.currentLocation.coordinate.longitude) accuracyLL:nil altitude:@(self.currentLocation.altitude) accuracyAlt:nil query:nil limit:@(30) intent:0 radius:@(800)categoryId:@"4d4b7105d754a06374d81259" callback:^(BOOL success, id result) {
        if(success) {
            NSDictionary *dic = result;
            NSArray* venues = [dic valueForKeyPath:@"response.venues"];
            FSConverter *converter = [[FSConverter alloc]init];
            self.places = [converter convertToObjects:venues];
            NSLog(@"Success"); // debug
        } else {
            NSLog(@"Fail"); // debug
        }
    }];
}

@end
