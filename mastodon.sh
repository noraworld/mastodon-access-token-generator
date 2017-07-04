#!/bin/sh

if [ -f "env.json" ]; then
  host=`cat env.json | jq ".host" | sed -e "s/\"//g"`
  client_name=`cat env.json | jq ".client_name" | sed -e "s/\"//g"`
  scopes=`cat env.json | jq ".scopes" | sed -e "s/\"//g"`
else
  echo -n "Enter your host (start with http or https): "
  read host
  echo -n "Enter client name: "
  read client_name
  echo -n "Enter scope: "
  read scopes
  echo ""
fi

client=`curl -X POST -sS $host/api/v1/apps -F "client_name=$client_name" -F "redirect_uris=urn:ietf:wg:oauth:2.0:oob" -F "scopes=$scopes"`

client_id=`echo "$client" | jq ".client_id" | sed -e "s/\"//g"`
client_secret=`echo "$client" | jq ".client_secret" | sed -e "s/\"//g"`
scope=`echo "$scopes" | sed -e "s/ /%20/g"`

echo "Access $host/oauth/authorize?client_id=$client_id&response_type=code&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=$scope and click \"AUTHORIZE\" button. Then copy the code and paste it here after the message \"Enter authorization code\"."
echo ""

echo -n "Enter authorization code: "
read code

token=`curl -X POST -sS $host/oauth/token -F "grant_type=authorization_code" -F "redirect_uri=urn:ietf:wg:oauth:2.0:oob" -F "client_id=$client_id" -F "client_secret=$client_secret" -F "code=$code"`
echo ""

access_token=`echo "$token" | jq ".access_token" | sed -e "s/\"//g"`
echo "Your access token is $access_token."
