# Session-analytics
Implement a new analytics “sessions” view. where a given a set of data that consists of individual web page visits, along with a visitorId which is generated by a tracking cookie that uniquely identifies each visitor. From this data we need to generate a list of sessions for each visitor.

## Rules
Here are the following rules:
* Timestamps are in milliseconds.
* Events may not be given in chronological order.
* The visitors in sessionsByUser can be in any order.
* For each visitor, sessions to be in chronological order.
* For each session, the URLs should be sorted in chronological order
* For a session with only one event the duration should be zero
* Each event in a session (except the first event) must have occurred within 10 minutes of the preceding event in the session. This means that there can be more than 10 minutes between the first and the last event in the session.

## Sample Json
The data set looks like this:

```
{
    "events": [
         {
             "url": "/pages/a-big-river",
             "visitorId": "d1177368-2310-11e8-9e2a-9b860a0d9039",
             "timestamp": 1512754583000
         },
         {
             "url": "/pages/a-small-dog",
             "visitorId": "d1177368-2310-11e8-9e2a-9b860a0d9039",
             "timestamp": 1512754631000
         },
        {
            "url": "/pages/a-big-talk",
            "visitorId": "f877b96c-9969-4abc-bbe2-54b17d030f8b",
            "timestamp": 1512709065294
        },
        {
            "url": "/pages/a-sad-story",
            "visitorId": "f877b96c-9969-4abc-bbe2-54b17d030f8b",
            "timestamp": 1512711000000
        },
        {
            "url": "/pages/a-big-river",
            "visitorId": "d1177368-2310-11e8-9e2a-9b860a0d9039",
            "timestamp": 1512754436000
        },
        {
            "url": "/pages/a-sad-story",
            "visitorId": "f877b96c-9969-4abc-bbe2-54b17d030f8b",
            "timestamp": 1512709024000
        }
    ]
}
```
## Result 
```
{
    "sessionsByUser": {
        "f877b96c-9969-4abc-bbe2-54b17d030f8b": [
            {
                "duration": 41294,
                "pages": [
                    "/pages/a-sad-story",
                    "/pages/a-big-talk"
                ],
                "startTime": 1512709024000
            },
            {
                "duration": 0,
                "pages": [
                    "/pages/a-sad-story"
                ],
                "startTime": 1512711000000
            }
        ],
        "d1177368-2310-11e8-9e2a-9b860a0d9039": [
            {
                "duration": 195000,
                "pages": [
                    "/pages/a-big-river",
                    "/pages/a-big-river",
                    "/pages/a-small-dog"
                ],
                "startTime": 1512754436000
            }
        ]
    }
}
```

## How to Run the Program

```
$ git clone https://github.com/Ceejayski/session-analytics-ruby
```
This linter checks all Javascript file(.js) within the folder, follow the steps below to get setup
- Open your git bash and clone the repo.

- go to the folder and copy out the bin and lib folder into your project directory

- run ```ruby ./bin/main.rb``` 

- Good job you are now setup and ready to Generate some user Session hashes 👌🙌

## Authors:

👤 **Ceejayski**

- Github: [@Ceejayski](https://github.com/Ceejayski)

- LinkedIn: [LinkedIn](https://www.linkedin.com/in/okoli-ceejay/)

## Show your support

Give a ⭐️ if you like this project!
