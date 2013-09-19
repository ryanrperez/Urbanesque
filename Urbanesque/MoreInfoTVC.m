//
//  MoreInfoTVC.m
//  Urbanesque
//
//  Created by Lauren Jaramillo on 9/17/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "MoreInfoTVC.h"

@interface MoreInfoTVC ()
@property (nonatomic, strong)FSVenue* place;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *status;

@end

@implementation MoreInfoTVC

#define NUMBER_OF_SECTIONS 2

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
    if(self.place.isLiked) {
        self.status.title = @"Unlike";
        NSLog(@"Set Liked title");
    } else {
        self.status.title = @"Like";
        NSLog(@"Set Unliked title");
    }
}

- (void)setPlace:(FSVenue*)place {
    _place = place;
}

- (IBAction)likeOrUnlikePlace:(UIBarButtonItem *)sender {
    if(self.place.isLiked) {
        [self unlikePlace];
        NSLog(@"Finished Unliking");
    } else {
        [self likePlace];
        NSLog(@"Finished Liking");
    }
}

- (void)unlikePlace {
    NSMutableDictionary *mutableFavPlacesFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"Fav Places"] mutableCopy];
    if (!mutableFavPlacesFromUserDefaults) mutableFavPlacesFromUserDefaults = [[NSMutableDictionary alloc] init];
    [mutableFavPlacesFromUserDefaults removeObjectForKey:self.place.venueId];
    [[NSUserDefaults standardUserDefaults] setObject:mutableFavPlacesFromUserDefaults forKey:@"Fav Places"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.place.isLiked = NO;
    self.status.title = @"Like";
}

- (void)likePlace {
    NSMutableDictionary *mutableFavPlacesFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"Fav Places"] mutableCopy];
    if (!mutableFavPlacesFromUserDefaults) mutableFavPlacesFromUserDefaults = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* newEntry = [[NSMutableDictionary alloc] init];
    newEntry[@"Name"] = self.place.name;
    newEntry[@"Address"] = self.place.location.address;
    newEntry[@"URL"] = self.place.url;
    mutableFavPlacesFromUserDefaults[self.place.venueId] = newEntry;
    NSLog(@"Set Place");
    [[NSUserDefaults standardUserDefaults] setObject:mutableFavPlacesFromUserDefaults forKey:@"Fav Places"];
    NSLog(@"Set Plist");
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.place.isLiked = YES;
    self.status.title = @"Unlike";
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            static NSString *cellIdentifier = @"Name";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
        cell.textLabel.text = self.place.name;
        return cell;
        } else if (indexPath.row == 1) {
            static NSString *cellIdentifier = @"Address";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            cell.textLabel.text = self.place.location.address;
            return cell;
        }
    }
    
    if(indexPath.section == 1) {
        static NSString *cellIdentifier = @"More";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text = @"Show More Info";
        return cell;
    }

    return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
