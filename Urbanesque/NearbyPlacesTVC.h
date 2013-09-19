//
//  NearbyPlacesTVC.h
//  Urbanesque
//
//  Created by Lauren Jaramillo on 8/19/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "PlacesTVC.h"
#import "Foursquare2.h"
#import "FSConverter.h"
#import <CoreLocation/CoreLocation.h>

@interface NearbyPlacesTVC : PlacesTVC <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, strong) CLLocation* currentLocation;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

- (void)getNearbyPlaces;


@end
