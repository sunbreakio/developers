# Spec: Database

This API allows connect/disconnect your databases.

{% method -%}
## Connect

Connect to existing database or create new one.

This method returns [Long Access Token](../GLOSSARY.md#long-access-token) which is required to get
[Short Access Token](../GLOSSARY.md#short-access-token) - main token for all requests.

Set parameter `isNewUser: true` to register new user.

**Method**

    POST

**URI**

    /api/database/connection

**Headers**

    Content-Type	application/json


**Body**
```json
{
    "data": [
        {
            "email": "some-user@example.com",
            "password": "some_secret_password",
            "name": "Some User"
        }
    ],
    "context": {
        "domain": "mycooldomain.com",
        "isNewUser": true,
        "location": "custom",
        "locale": "en"
    }
}
```

**Result**
```json
{
    "accessToken": "<long-access-token>",
    "name": "Some User"
}
```

{% sample lang='js' -%}
```javascript
const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

const raw = JSON.stringify({"data":[{"email":"some-user@example.com","password":"some_secret_password","name":"Some User"}],"context":{"domain":"mycooldomain.com","isNewUser":true,"location":"custom","locale":"en"}});

const requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://dev.api.sunbreak.io/api/database/connection", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
const request = require('request');
const options = {
  'method': 'POST',
  'url': 'https://dev.api.sunbreak.io/api/database/connection',
  'headers': {
    'Content-Type': ['application/json']
  },
  body: JSON.stringify({"data":[{"email":"some-user@example.com","password":"some_secret_password","name":"Some User"}],"context":{"domain":"mycooldomain.com","isNewUser":true,"location":"custom","locale":"en"}})

};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

{% sample lang="php" -%}
```php
<?php
require_once 'HTTP/Request2.php';
$request = new HTTP_Request2();
$request->setUrl('https://dev.api.sunbreak.io/api/database/connection');
$request->setMethod(HTTP_Request2::METHOD_POST);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Content-Type' => 'application/json'
));
$request->setBody('{\n	"data": [{\n		"email": "some-user@example.com",\n		"password": "some_secret_password",\n		"name": "Some User"\n	}],\n	"context": {\n		"domain": "mycooldomain.com",\n		"isNewUser": true,\n		"location": "custom",\n		"locale": "en"\n	}\n}');
try {
  $response = $request->send();
  if ($response->getStatus() == 200) {
    echo $response->getBody();
  }
  else {
    echo 'Unexpected HTTP status: ' . $response->getStatus() . ' ' .
    $response->getReasonPhrase();
  }
}
catch(HTTP_Request2_Exception $e) {
  echo 'Error: ' . $e->getMessage();
}
```
{% endmethod %}

---

{% method -%}
## Disconnect

Disconnect database

**Method**

    DELETE

**URI**

    /api/database/connection

**Headers**

    Content-Type	application/json
    Authorization   Bearer <long-access-token>

**Result**
```json
{}
```

{% sample lang='js' -%}
```javascript
const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer <long-access-token>");

const apiURL = 'https://dev.api.sunbreak.io/'
const requestOptions = {
  method: 'DELETE',
  headers: myHeaders,
  redirect: 'follow'
};

fetch(apiURL + "api/database/connection", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
const request = require('request');
const apiURL = 'https://dev.api.sunbreak.io/'
const options = {
  'method': 'POST',
  'url': apiURL + 'api/database/connection',
  'headers': {
    'Content-Type': ['application/json'],
    'Authorization': 'Bearer <long-access-token>'
  }
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

{% sample lang="php" -%}
```php
<?php
require_once 'HTTP/Request2.php';
$request = new HTTP_Request2();
$request->setUrl('https://dev.api.sunbreak.io/api/database/connection');
$request->setMethod(HTTP_Request2::METHOD_DELETE);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$longAccessToken = 'long_access_token';
$request->setHeader(array(
  'Content-Type' => 'application/json',
  'Authorization' => "Bearer {$longAccessToken}"
));

try {
  $response = $request->send();
  if ($response->getStatus() == 200) {
    echo $response->getBody();
  }
  else {
    echo 'Unexpected HTTP status: ' . $response->getStatus() . ' ' .
    $response->getReasonPhrase();
  }
}
catch(HTTP_Request2_Exception $e) {
  echo 'Error: ' . $e->getMessage();
}
```
{% endmethod %}

<br/>
<br/>
<br/>
