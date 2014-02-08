### Simple iOS Twitter client


User Stories:

    In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
    User can compose a new tweet by tapping on the 'New' button at the navigation bar.
    User can tap on a tweet to view it, with controls to retweet, favorite, and reply. NOTE: Reply works within the same UIView. It reads the text from a TextField.
    Retweeting and favoriting should increment the retweet and favorite count.
    User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
    Replies are prefixed with the username and the reply_id should be set when posting a new tweet.
    (After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.)
    (User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client. User can pull to refresh)
