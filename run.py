import os
import praw
import requests
import time
import logging

# Reddit API credentials
reddit_client_id = os.environ.get('REDDIT_CLIENT_ID')
reddit_client_secret = os.environ.get('REDDIT_CLIENT_SECRET')
reddit_username = os.environ.get('REDDIT_USERNAME')
reddit_password = os.environ.get('REDDIT_PASSWORD')
reddit_user_agent = os.environ.get('REDDIT_USER_AGENT')

# Discord webhook URL
discord_webhook_url = os.environ.get('DISCORD_WEBHOOK_URL')

# Subreddits to monitor
subreddits = ['FreeGamesOnSteam', 'FreeGameFindings']

# Initialize Reddit API
reddit = praw.Reddit(client_id=reddit_client_id,
                     client_secret=reddit_client_secret,
                     username=reddit_username,
                     password=reddit_password,
                     user_agent=reddit_user_agent)

# Initialize logging
logging.basicConfig(filename='script.log', level=logging.INFO)

# Function to send notification to Discord webhook
def send_discord_notification(title, content, url, author, upvotes, subreddit_name):
    payload = {
        'content': f'New post in r/{subreddit_name}:\n**{title}**\nAuthor: {author}\nUpvotes: {upvotes}\n{content}\n{url}'
    }
    requests.post(discord_webhook_url, json=payload)

# Main loop to check for new posts in multiple subreddits
while True:
    try:
        for subreddit_name in subreddits:
            subreddit = reddit.subreddit(subreddit_name)
            for submission in subreddit.new(limit=1):
                logging.info(f"Processing post in r/{subreddit_name}: {submission.title}")

                # Send notification to Discord
                send_discord_notification(submission.title, submission.selftext, submission.url, submission.author, submission.score, subreddit_name)
            
        # Wait for some time before checking again
        time.sleep(300)  # Adjust the interval (in seconds) as needed

    except praw.exceptions.PRAWException as praw_error:
        logging.error(f"PRAW error occurred: {praw_error}")
        time.sleep(60)  # Wait for a minute before trying again

    except Exception as e:
        logging.error(f"An error occurred: {e}")
        time.sleep(60)  # Wait for a minute before trying again
