//
//  TimelineVC.m
//  twitter
//
//  Created by Timothy Lee on 8/4/13.
//  Contritutor:  Alberto Campos
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TimelineVC.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "ViewTweet.h"
#import "CreateTweet.h"
#import "NSDate+TimeAgo.h"

@interface TimelineVC ()
{

    ViewTweet *vTweet;
    CreateTweet *cTweet;
    Tweet *tweet;
    
}

@property (nonatomic, strong) NSMutableArray *tweets;

- (void)onSignOutButton;
- (void)reload;

@end

@implementation TimelineVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Twitter";
        
        [self reload];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onSignOutButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(onNewTweetButton)];
    
    
    UINib *customNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"TweetCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweets.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [indexPath row] + 220;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDate *timestamp = [[NSDate alloc] initWithTimeIntervalSince1970:0];
    static NSString *CellIdentifier = @"TweetCell";
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    tweet = self.tweets[indexPath.row];
    //cell.textLabel.text = tweet.text;
    cell.author.text = [tweet.user valueForKey:@"name"];
    //cell.imageView.image = [tweet.user valueForKey:@"profile_image_url"];
    cell.twitter_id.text = [tweet.user valueForKey:@"screen_name"];
    cell.ext_tweet.text = tweet.text;
    cell.id_hidden.text = tweet.tweet_id;
    
    timestamp = [tweet.user valueForKey:@"created_at"];
    cell.time_published.text = [tweet.user valueForKey:@"created_at"];;
    
//    NSString *ago = [timestamp timeAgo];
  //  cell.time_published.text = ago;
    
    
    NSNumber *favCount = [tweet.user valueForKey:@"favourites_count"];
    NSNumber *notFav;
    
    notFav = 0;
    
    if ( favCount != notFav)
    {
        [cell.favoritesButton setImage:[UIImage imageNamed:@"star_silver.png"] forState:UIControlStateNormal];
    }
    else
    {
        [cell.favoritesButton setImage:[UIImage imageNamed:@"star_yellow.png"] forState:UIControlStateNormal];
    }
    
    
    
    //Download images asynchronously
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:[tweet.user valueForKey:@"profile_image_url"], indexPath.row]];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];

    
    [cell.previewImage setImageWithURLRequest:urlRequest
                             placeholderImage:nil
                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                          cell.previewImage.image = image;
                                      } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                          NSLog(@"Failed to download image: %@", error);
                                      }];

   // [SVProgressHUD dismiss];
    
   // [self next];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (!vTweet) {
        vTweet = [[ViewTweet alloc] initWithNibName:@"ViewTweet" bundle:nil];
    
    }
    [self.navigationController pushViewController:vTweet animated:YES];

    NSNumber *myFavCount;
    Tweet *myTweet = self.tweets[indexPath.row];
    myFavCount = [myTweet.user valueForKey:@"favourites_count"];
    
    NSString *numStr = [NSString stringWithFormat:@"%@",myFavCount];
    NSString *tweetStr = [NSString stringWithFormat:@"%@",myTweet.retweetCount];
    
    
    // Prepare view with values
    vTweet.tweetAuthor.text = [myTweet.user valueForKey:@"name"];
    vTweet.twitter_id.text = [myTweet.user valueForKey:@"screen_name"];
    vTweet.tweetDetail.text = myTweet.text;
    vTweet.time_published.text = [myTweet.user valueForKey:@"created_at"];
    vTweet.retweetsCount.text = numStr;
    vTweet.favoritesCount.text = tweetStr;
    
    //Download images asynchronously
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:[myTweet.user valueForKey:@"profile_image_url"], indexPath.row]];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    
    [vTweet.previewImage setImageWithURLRequest:urlRequest
                             placeholderImage:nil
                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                          vTweet.previewImage.image = image;
                                      } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                          NSLog(@"Failed to download image: %@", error);
                                      }];

    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Private methods

- (void)onSignOutButton {
    [User setCurrentUser:nil];
}


- (void)onNewTweetButton {
    if (!cTweet) {
        cTweet = [[CreateTweet alloc] initWithNibName:@"CreateTweet" bundle:nil];
        
    }
    [self.navigationController pushViewController:cTweet animated:YES];
    
    //cTweet.author.text = @"This is the On New Tweet Button";
    cTweet.author.text = [tweet.user valueForKey:@"screen_name"];
    cTweet.screen_nameLabel.text = [tweet.user valueForKey:@"name"];
    //vTweet.tweetDetail.text = [myTweet.user valueForKey:@"screen_name"];
    
   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)reload {
    [[TwitterClient instance] homeTimelineWithCount:20 sinceId:0 maxId:0 success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.tweets = [Tweet tweetsWithArray:response];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

-(IBAction)next
{

    vTweet.tweetAuthor.text = [tweet.user valueForKey:@"name"];
    vTweet.tweetDetail.text = [tweet.user valueForKey:@"screen_name"];
}

@end
