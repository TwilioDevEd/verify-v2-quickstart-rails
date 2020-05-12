<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Twilio Verify Quickstart with Twilio and Rails

![](https://github.com/TwilioDevEd/verify-v2-quickstart-rails/workflows/Ruby/badge.svg)

> We are currently in the process of updating this sample template. If you are encountering any issues with the sample, please open an issue at [github.com/twilio-labs/code-exchange/issues](https://github.com/twilio-labs/code-exchange/issues) and we'll try to help you.

## About

This application example demonstrates how to do simple phone verification with Ruby on Rails Framework, and Twilio Verify.

Learn more about Account Security and when to use the Authy API vs the Verify API in the [Account Security documentation](https://www.twilio.com/docs/verify/authy-vs-verify).

Implementations in other languages:

| .NET | Java | Python | PHP | Node |
| :--- | :--- | :----- | :-- | :--- |
| [Done](https://github.com/TwilioDevEd/verify-v2-quickstart-csharp) | [Done](https://github.com/TwilioDevEd/verify-v2-quickstart-java)  | [Done](https://github.com/TwilioDevEd/verify-v2-quickstart-python)    | [Done](https://github.com/TwilioDevEd/verify-v2-quickstart-php) | [Done](https://github.com/TwilioDevEd/verify-v2-quickstart-node)  |

## Set up

### Requirements

- [Ruby](https://www.ruby-lang.org/) **2.6.x** version.
- [Sqlite3](https://www.sqlite.org/)

### Twilio Account Settings

This application should give you a ready-made starting point for writing your own application.
Before we begin, we need to collect all the config values we need to run the application:

| Config Value | Description |
| :----------  | :---------- |
| TWILIO_ACCOUNT_SID / TWILIO_AUTH_TOKEN  | For Twilio API credentials find [here](https://www.twilio.com/console)|
| TWILIO_VERIFICATION_SID  | For Verification Service SID [here](https://www.twilio.com/console/verify/services) |

### Local Development

1. Clone the project and cd into it.
    ```bash
    git clone https://github.com/TwilioDevEd/verify-v2-quickstart-rails.git
    cd verify-v2-quickstart-rails/
    ```

1. Install gem dependencies.
    ```bash
    make install
    ```

1. Copy `.env` file.
    ```bash
    cp .env.example .env
    ```

    See [Twilio Account Settings](#twilio-account-settings) to locate the necessary environment variables.

1. Create the database and run migrations.

   ```bash
    make database
   ```

1. Run the application.
    ```bash
    make serve
    ```

1. Navigate to [http://localhost:3000](http://localhost:3000)

That's it!

### Tests

You can run the tests locally by typing:

```bash
bundle exec rails test
```

### Cloud deployment

Additionally to trying out this application locally, you can deploy it to a variety of host services. Here is a small selection of them.

Please be aware that some of these might charge you for the usage or might make the source code for this application visible to the public. When in doubt research the respective hosting service first.

| Service                           |                                                                                                                                                                                                                           |
| :-------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Heroku](https://www.heroku.com/) | [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)                                                                                                                                       |

## Resources

- The CodeExchange repository can be found [here](https://github.com/twilio-labs/code-exchange/).

## Contributing

This template is open source and welcomes contributions. All contributions are subject to our [Code of Conduct](https://github.com/twilio-labs/.github/blob/master/CODE_OF_CONDUCT.md).

## License

[MIT](http://www.opensource.org/licenses/mit-license.html)

## Disclaimer

No warranty expressed or implied. Software is as is.

[twilio]: https://www.twilio.com
