//
//  NightlifeTVC.m
//  Urbanesque
//
//  Created by Lauren Jaramillo on 8/19/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "NightlifeTVC.h"

@interface NightlifeTVC ()

@end

@implementation NightlifeTVC

- (void)getNearbyPlaces {
    [Foursquare2 searchVenuesNearByLatitude:@(self.currentLocation.coordinate.latitude) longitude:@(self.currentLocation.coordinate.longitude) accuracyLL:nil altitude:@(self.currentLocation.altitude) accuracyAlt:nil query:@"" limit:@(30) intent:intentCheckin radius:nil categoryId:@"4d4b7105d754a06376d81259" callback:^(BOOL success, id result) {
        if(success) {
            NSDictionary *dic = result;
            NSArray* venues = [dic valueForKeyPath:@"response.venues"];
            FSConverter *converter = [[FSConverter alloc]init];
            self.places = [converter convertToObjects:venues];
        }
    }];
}


@end
