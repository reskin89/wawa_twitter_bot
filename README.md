# wawa_twitter_bot
To find my damn wawa pizza

This is a simple go script that will select a random quote from [quotes.txt](quotes.txt) and tweet it.

It reads the text file, finds the amount of lines and selects a random number between 0 - (len-1) to account for the slice array.

It is run by a concourse pipeline on a local concourse server with a 6 hour timer setup so this will happen every 6 hours.

The environment variables required for the script are the tokens from twitter developer:

```
ACCESS_TOKEN
ACCESS_TOKEN_SECRET
CONSUMER_KEY
CONSUMER_SECRET
```
