//
//  PlacesTVC.m
//  Urbanesque
//
//  Created by Lauren Jaramillo on 7/24/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "PlacesTVC.h"

@interface PlacesTVC () <CLLocationManagerDelegate>

@end

@implementation PlacesTVC


- (void)setPlaces:(NSArray *)places {
    _places = places;
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    if([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath* indexPath = [self.tableView indexPathForCell:sender];
        if(indexPath) {
            if([segue.identifier isEqualToString:@"Show More Info"]) {
                if([segue.destinationViewController respondsToSelector:@selector(setPlace:)]) {
                    [segue.destinationViewController performSelector:@selector(setPlace:) withObject:((FSVenue*)self.places[indexPath.row])];
                    [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
                }
            }
        }
    }
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.places count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Place";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    FSVenue* place = self.places[indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = place.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ miles away", place.location.distance];
    return cell;
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
