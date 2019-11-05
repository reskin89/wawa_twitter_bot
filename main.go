package main

import (
	"log"
  "github.com/dghubble/go-twitter/twitter"
  "github.com/dghubble/oauth1"
  "strings"
  "io/ioutil"
  "os"
  "math/rand"
  "time"
)

type Credentials struct {
    ConsumerKey       string
    ConsumerSecret    string
    AccessToken       string
    AccessTokenSecret string
}

func main() {
  var filename string = "quotes.txt"
  rand.Seed(time.Now().UTC().UnixNano())

  creds := Credentials {
    ConsumerKey : os.Getenv("CONSUMER_KEY"),
    ConsumerSecret : os.Getenv("CONSUMER_SECRET"),
    AccessToken : os.Getenv("ACCESS_TOKEN"),
    AccessTokenSecret : os.Getenv("ACCESS_TOKEN_SECRET")}

  client, err := getClient(&creds)
  if err != nil {
      log.Println("Error getting Twitter Client")
      log.Println(err)
  }

  quote := getQuote(filename)

  log.Println("Quote Chosen: \""+ quote + "\"")

  tweet, resp, err := client.Statuses.Update(quote, nil)
  if err != nil {
      log.Println(err)
  }
  log.Printf("%+v\n", tweet)
  log.Printf("%+v\n", resp)

}

func getQuote(filename string) string {
    log.Println("Fetching Quote....")

    content, err := ioutil.ReadFile(filename)
    if err != nil {
      log.Printf("Error Fetching Quote! \n%s", err)
    }

    log.Printf("Quotes Available: \n%s",content)

    quotes := strings.Split(string(content),"\n")

    numQuotes := len(quotes)

    return quotes[rand.Intn(numQuotes-1)]
}

func getClient(creds *Credentials) (*twitter.Client, error) {
    // Pass in your consumer key (API Key) and your Consumer Secret (API Secret)
    config := oauth1.NewConfig(creds.ConsumerKey, creds.ConsumerSecret)
    // Pass in your Access Token and your Access Token Secret
    token := oauth1.NewToken(creds.AccessToken, creds.AccessTokenSecret)

    httpClient := config.Client(oauth1.NoContext, token)
    client := twitter.NewClient(httpClient)

    // Verify Credentials
    verifyParams := &twitter.AccountVerifyParams{
        SkipStatus:   twitter.Bool(true),
        IncludeEmail: twitter.Bool(true),
    }

    // we can retrieve the user and verify if the credentials
    // we have used successfully allow us to log in!
    user, _, err := client.Accounts.VerifyCredentials(verifyParams)
    if err != nil {
        return nil, err
    }

    log.Printf("User's ACCOUNT:\n%+v\n", user)
    return client, nil
}
