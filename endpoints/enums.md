# Enums

This API works with enums (pick lists).

Enum - container for list of any values which can be used to display in DropDown or List controls.

{% method -%}
## Create

**Method**

    POST

**URI**

    /api/enums

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "data": [
        {
            "name": "Enum 1"
        }
    ],
    "context": {}
}
```

**Result**
```json
[
  {
    "id": 48,
    "systemName": "4ff7c4d6-8d26-4ab1-9d8d-8456c8d9894b",
    "name": "Enum 1",
    "options": {},
    "updatedAt": "2020-04-07T08:16:35.069Z",
    "createdAt": "2020-04-07T08:16:35.069Z",
    "description": null
  }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"data":[{"name":"Enum 1"}],"context":{}});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api.sunbreak.dev/api/enums", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://api.sunbreak.dev/api/enums',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"data":[{"name":"Enum 1"}],"context":{}})

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
$request->setUrl('https://api.sunbreak.dev/api/enums');
$request->setMethod(HTTP_Request2::METHOD_POST);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "data": [\n        {\n            "name": "Enum 1"\n        }\n    ],\n    "context": {}\n}');
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
## Get

This method allows to find existing enum by its 'name'.

See [Where](../querying/where.md) for more details.

**Method**

    GET

**URI**

    /api/enums

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "filter": {
        "where": {
          "operator": "=",
          "args": ["name", "Enum 1"]
        }
    },
    "context": {}
}
```

**Result**
```json
{
  "count": 1,
  "rows": [
    {
        "id": 48,
        "systemName": "4ff7c4d6-8d26-4ab1-9d8d-8456c8d9894b",
        "name": "Enum 1",
        "options": {},
        "updatedAt": "2020-04-07T08:16:35.069Z",
        "createdAt": "2020-04-07T08:16:35.069Z",
        "description": null
      }
  ]
}
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"filter":{"where":{"operator":"=","args":["name","Enum 1"]}},"context":{}});

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api.sunbreak.dev/api/enums", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://api.sunbreak.dev/api/enums',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"filter":{"where":{"operator":"=","args":["name","Enum 1"]}},"context":{}})

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
$request->setUrl('https://api.sunbreak.dev/api/enums');
$request->setMethod(HTTP_Request2::METHOD_GET);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "filter": {\n        "where": {\n            "operator": "=",\n            "args": [\n                "name",\n                "Enum 1"\n            ]\n        }\n    },\n    "context": {}\n}');
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
## Update

**Method**

    PUT

**URI**

    /api/enums

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "data": [
        {
            "id": 48,
            "name": "Enum 2"
        }
    ],
    "context": {}
}
```

**Result**
```json
[
  {
    "id": 48,
    "systemName": "4ff7c4d6-8d26-4ab1-9d8d-8456c8d9894b",
    "name": "Enum 2",
    "options": {},
    "updatedAt": "2020-04-07T10:00:12.069Z",
    "createdAt": "2020-04-07T08:16:35.069Z",
    "description": null
  }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"data":[{"id":49,"name":"Enum 2"}],"context":{}});

var requestOptions = {
  method: 'PUT',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api.sunbreak.dev/api/enums", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'PUT',
  'url': 'https://api.sunbreak.dev/api/enums',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"data":[{"id":49,"name":"Enum 2"}],"context":{}})

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
$request->setUrl('https://api.sunbreak.dev/api/enums');
$request->setMethod(HTTP_Request2::METHOD_PUT);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "data": [\n        {\n            "id": 49,\n            "name": "Enum 2"\n        }\n    ],\n    "context": {}\n}');
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
## Delete

This method allows to delete existing enum by its 'id'.

See [Where](../querying/where.md) for more details.

**Method**

    DELETE

**URI**

    /api/enums

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "filter": {
        "where": {
          "operator": "=",
          "args": ["id", 48]
        }
    },
    "context": {}
}
```

**Result**
```json
[
  {
    "id": 48,
    "systemName": "4ff7c4d6-8d26-4ab1-9d8d-8456c8d9894b",
    "name": "Enum 1",
    "options": {},
    "updatedAt": "2020-04-07T10:00:12.069Z",
    "createdAt": "2020-04-07T08:16:35.069Z",
    "description": null
  }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"filter":{"where":{"operator":"=","args":["id",49]}},"context":{}});

var requestOptions = {
  method: 'DELETE',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api.sunbreak.dev/api/enums", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'DELETE',
  'url': 'https://api.sunbreak.dev/api/enums',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"filter":{"where":{"operator":"=","args":["id",49]}},"context":{}})

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
$request->setUrl('https://api.sunbreak.dev/api/enums');
$request->setMethod(HTTP_Request2::METHOD_DELETE);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "filter": {\n        "where": {\n            "operator": "=",\n            "args": [\n                "id",\n                49\n            ]\n        }\n    },\n    "context": {}\n}');
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
