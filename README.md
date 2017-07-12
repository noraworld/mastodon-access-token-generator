# Mastodon Access Token Generator
Generate an access token for Mastodon.

## Requirement

- jq

## Usage
For details on the Mastodon API, see [API overview](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md#apps).

### Interactive mode

```
$ sh mastodon.sh
Enter your host: https://mastodon.social
Enter client name: My Mastodon App
Enter scope: read write follow
Enter website: (optional) http://myappwebsite.com

Access https://mastodon.social/oauth/authorize?client_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&response_type=code&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=read%20write%20follow and click "AUTHORIZE" button. Then copy the code and paste it here after the message "Enter authorization code".

Enter authorization code: yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy

Your access token is zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz.
```

Now you can use `zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz` as an access token to your Mastodon application.

### Recyclable mode
Copy `env.json.sample` to `env.json` and edit `env.json`.

```sh
$ cp env.json.sample env.json
# Edit env.json
```

The generator reads `env.json` automatically if it exists.

```
$ sh mastodon.sh
Access https://mastodon.social/oauth/authorize?client_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&response_type=code&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=read%20write%20follow and click "AUTHORIZE" button. Then copy the code and paste it here after the message "Enter authorization code".

Enter authorization code: yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy

Your access token is zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz.
```

Now you can use `zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz` as an access token to your Mastodon application.

## License
Copyright (c) 2017 noraworld - [MIT License](https://github.com/noraworld/mastodon-access-token-generator/blob/master/LICENSE)
