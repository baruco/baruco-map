# Baruco Map

You should first put some needed env variables in a `.env` file in the root of
the directory:

    AMIANDO_API_KEY=xxxxx
    AMIANDO_EVENT_ID=51748118
    GOOGLE_ANALYTICS_ID="UA-28339484-2"

Then you can set those variables to your current environment:

    $ export "`cat .env`"

## How to run the app

    $ foreman start

**Note**: Foreman will automatically use the .env file without having to export
the variables first.

## How to run the tests

Then you can run the test suite:

    $ rake

## Seeding the database

    $ rake sync_tickets