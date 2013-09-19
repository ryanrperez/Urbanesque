//
//  FavPlacesTVC.m
//  Urbanesque
//
//  Created by Lauren Jaramillo on 8/19/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "FavPlacesTVC.h"

@interface FavPlacesTVC ()

@end

@implementation FavPlacesTVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
	if(self) {
        NSMutableArray* allPlaces = [[NSMutableArray alloc] init];
        for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"Fav Places"] allValues]) {
            FSVenue* savedVenue = [[FSVenue alloc] init];
            savedVenue.name = plist[@"Name"];
            savedVenue.location.address = plist[@"Address"];
            savedVenue.url = plist[@"URL"];
            [allPlaces addObject:savedVenue];
        }
        self.places = allPlaces;
    }
}


@end
