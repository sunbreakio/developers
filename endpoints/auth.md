# Spec: Auth

You need this method to retrieve [Short Access Token](../GLOSSARY.md#short-access-token)

{% method -%}
## Subscribe

Get short living accessToken to be able make all helpful requests.

Life time of this token just 1 day, then you need to renew it by this command

This method requires [Long Access Token](../GLOSSARY.md#long-access-token) which you can retrieve using
[Database Connect](database.md#connect) method

**Method**

    POST

**URI**

    /api/auth/subscribe

**Headers**

    Content-Type	application/json
    Authorization   Bearer <long-access-token>

**Body**
```json
{
    "data": [
        {
            "permissions": {
                "isAdmin": true,
                "tables": {}
            }
        }
    ],
    "context": {}
}
```

`data: array` - it's container for payload, it always should be an array of objects

`data.permissions: object` - allows to define permissions for admin and normal users

`data.permissions.isAdmin: boolean` - gives full access if is `true`

`data.permissions.tables: object` - allows to define special permissions per table, where
'key' of each object properties is 'tableName' from specific table access should be restricted to

```json
{
  "c0a45736-6225-4fd0-bd3c-70e956b3e9d6": {
      "create": true,
      "read": true,
      "update": true,
      "delete": false
  }
}
```

Full view of `permissions` object should be like this:
```json
{
  "permissions": {
    "isAdmin": false,
    "tables": {
      "c0a45736-6225-4fd0-bd3c-70e956b3e9d6": {
        "create": true,
        "read": true,
        "update": true,
        "delete": false
      }
    }
  }
}
```

**Result**
```json
{
    "accessToken": "<short-access-token>",
    "channel": "mycooldomain_com"
}
```

{% sample lang='js' -%}
```javascript
const myHeaders = new Headers()
myHeaders.append("Content-Type", "application/json")
myHeaders.append("Authorization", "Bearer <long-access-token>")

const apiURL = "https://dev.api.sunbreak.io/"
const payload = {
  data: [{
      permissions: {
          isAdmin: false,
          tables: {
              "c0a45736-6225-4fd0-bd3c-70e956b3e9d6": {
                  create: true,
                  read: true,
                  update: true,
                  delete: false
              }
          }
      }
  }]
}

const requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: JSON.stringify(payload),
  redirect: 'follow'
}

fetch(apiURL + "api/auth/subscribe", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error))
```

{% sample lang="nodejs" -%}
```javascript
const request = require('request')

const apiURL = 'https://dev.api.sunbreak.io/'
const payload = {
  data: [{
      permissions: {
          isAdmin: false,
          tables: {
              "c0a45736-6225-4fd0-bd3c-70e956b3e9d6": {
                  create: true,
                  read: true,
                  update: true,
                  delete: false
              }
          }
      }
  }]
}
const options = {
  'method': 'POST',
  'url': apiURL + 'api/auth/subscribe',
  'headers': {
    'Content-Type': ['application/json'],
    'Authorization': 'Bearer <long-access-token>'
  },
  body: JSON.stringify(payload)
}

request(options, function (error, response) {
  if (error) throw new Error(error)
  console.log(response.body)
})
```

{% sample lang="php" -%}
```php
<?php
require_once 'HTTP/Request2.php';

$request = new HTTP_Request2();
$request->setUrl('https://dev.api.sunbreak.io/api/auth/subscribe');
$request->setMethod(HTTP_Request2::METHOD_POST);
$request->setConfig(array(
  'follow_redirects' => TRUE
));

$longAccessToken = 'long-access-token';
$request->setHeader(array(
  'Content-Type' => 'application/json',
  'Authorization' => "Bearer {$longAccessToken}"
));

$payload = array(
    'data' => array(
        'permissions' => array(
            'isAdmin' => false,
            'tables' => array(
                'c0a45736-6225-4fd0-bd3c-70e956b3e9d6' => array(
                    'create' => true,
                     'read' => true,
                     'update' => true,
                     'delete' => false
                )
            )
        )
    )
);
$request->setBody(json_encode($payload));
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
