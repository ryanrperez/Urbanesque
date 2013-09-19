//
//  NearbyPlacesTVC.m
//  Urbanesque
//
//  Created by Lauren Jaramillo on 8/19/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "NearbyPlacesTVC.h"

@interface NearbyPlacesTVC ()

@end

@implementation NearbyPlacesTVC

- (void)getNearbyPlaces {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(![Foursquare2 isAuthorized]) {
        [Foursquare2 setupFoursquareWithKey:@"SZRK3FJWI3SAPFTFIJEFNACY2IKJB410HTOSV5OMT20UPL25"
                                     secret:@"OTMYKF3VHJMUMZ202S4CQS5L4A4GULCV5CCVSLZZWIU5I0UI"
                                callbackURL:@"https://ryaninreallife.com"];

    }
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(refreshPlaces) forControlEvents:UIControlEventValueChanged];
    NSLog(@"Started Updating"); // debug
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    self.currentLocation = newLocation;
    if(newLocation.horizontalAccuracy <= 100.0f) {
        [self.locationManager stopUpdatingLocation];
        NSLog(@"Stopped Updating"); // debug
        [self getNearbyPlaces];
    }
}

- (void)refreshPlaces {
    [self getNearbyPlaces];
    [self.refreshControl endRefreshing];
}
@end
