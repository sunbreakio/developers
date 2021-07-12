# Objects

Main API which works with table rows.

Allows to add, get, change and delete table rows.

Each method has [context](../GLOSSARY.md#context): `tableName` - 
it should be table name of existing Metadata. 
We use UUID v4 as tableName.

{% method -%}
## Create

This method allows to create one or more objects for specific `tableName` as [context](../GLOSSARY.md#context).

**Method**

    POST
    
**URI**

    /api/objects

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>
    
**Body**
```json
{
    "data": [
        {
            "customField": "Test value"
        }
    ],
    "context": {
        "tableName": "245ce633-796f-4dfa-ae6f-4b2762adbf44"
    }
}
```

**Result**
```json
[
    {
        "id": 5,
        "customField": "Test value",
        "updatedAt": "2020-04-07T17:31:21.658Z",
        "createdAt": "2020-04-07T17:31:21.658Z"
    }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"data":[{"customField":"Test value"}],"context":{"tableName":"245ce633-796f-4dfa-ae6f-4b2762adbf44"}});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://mycooldomain.com/api/objects", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://mycooldomain.com/api/objects',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"data":[{"customField":"Test value"}],"context":{"tableName":"245ce633-796f-4dfa-ae6f-4b2762adbf44"}})

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
$request->setUrl('https://mycooldomain.com/api/objects');
$request->setMethod(HTTP_Request2::METHOD_POST);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n	"data": [{\n		"customField": "Test value"\n	}],\n	"context": {\n		"tableName": "245ce633-796f-4dfa-ae6f-4b2762adbf44"\n	}\n}');
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

This method allows to find existing object by its `id` and `tableName` as [context](../GLOSSARY.md#context).

Use [Metadata Create](metadata.md#create) to get `tableName`.

See [Where](../querying/where.md) for more details.

**Method**

    GET
    
**URI**

    /api/objects

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>
    
**Body**
```json
{
    "filter": {
        "where": {
          "operator": "=",
          "args": ["id", 5]
        }
    },
    "context": {
        "tableName": "245ce633-796f-4dfa-ae6f-4b2762adbf44"
    }
}
```

**Result**
```json
{
    "count": 1,
    "rows": [
        {
            "id": 5,
            "createdAt": "2020-04-07T17:31:21.658Z",
            "updatedAt": "2020-04-07T17:31:21.658Z",
            "customField": "Test value"
        }
    ]
}
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"filter":{"where":{"operator":"=","args":["id",5]}},"context":{"tableName":"245ce633-796f-4dfa-ae6f-4b2762adbf44"}});

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://mycooldomain.com/api/objects", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://mycooldomain.com/api/objects',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"filter":{"where":{"operator":"=","args":["id",5]}},"context":{"tableName":"245ce633-796f-4dfa-ae6f-4b2762adbf44"}})

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
$request->setUrl('https://mycooldomain.com/api/objects');
$request->setMethod(HTTP_Request2::METHOD_GET);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "filter": {\n        "where": {\n          "operator": "=",\n          "args": ["id", 5]\n        }\n    },\n    "context": {\n        "tableName": "245ce633-796f-4dfa-ae6f-4b2762adbf44"\n    }\n}');
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

This method allows update existing object field by its `id` and `tableName` as [context](../GLOSSARY.md#context).

**Method**

    PUT
    
**URI**

    /api/objects

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>
    
**Body**
```json
{
    "data": [
        {
            "id": 5,
            "customField": "Test value 1"
        }
    ],
    "context": {
        "tableName": "245ce633-796f-4dfa-ae6f-4b2762adbf44"
    }
}
```

**Result**
```json
[
    {
        "id": 5,
        "createdAt": "2020-04-07T17:31:21.658Z",
        "updatedAt": "2020-04-07T17:41:31.561Z",
        "customField": "Test value 1"
    }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"data":[{"id":5,"customField":"Test value 1"}],"context":{"tableName":"245ce633-796f-4dfa-ae6f-4b2762adbf44"}});

var requestOptions = {
  method: 'PUT',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://mycooldomain.com/api/objects", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'PUT',
  'url': 'https://mycooldomain.com/api/objects',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"data":[{"id":5,"customField":"Test value 1"}],"context":{"tableName":"245ce633-796f-4dfa-ae6f-4b2762adbf44"}})

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
$request->setUrl('https://mycooldomain.com/api/objects');
$request->setMethod(HTTP_Request2::METHOD_PUT);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "data": [\n        {\n            "id": 5,\n            "customField": "Test value 1"\n        }\n    ],\n    "context": {\n        "tableName": "245ce633-796f-4dfa-ae6f-4b2762adbf44"\n    }\n}');
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

This method allows to delete existing objects by their `id` and `tableName` as [context](../GLOSSARY.md#context).

See [Where](../querying/where.md) for more details.

**Method**

    DELETE
    
**URI**

    /api/objects

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>
    
**Body**
```json
{
    "filter": {
        "where": {
            "operator": "=",
            "args": [
                "id",
                5
            ]
        }
    },
    "context": {
        "tableName": "245ce633-796f-4dfa-ae6f-4b2762adbf44"
    }
}
```

**Result**
```json
[
    {
        "id": 5,
        "createdAt": "2020-04-07T17:31:21.658Z",
        "updatedAt": "2020-04-07T17:41:31.561Z",
        "customField": "Test value 1"
    }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"filter":{"where":{"operator":"=","args":["id",5]}},"context":{"tableName":"245ce633-796f-4dfa-ae6f-4b2762adbf44"}});

var requestOptions = {
  method: 'DELETE',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://mycooldomain.com/api/objects", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'DELETE',
  'url': 'https://mycooldomain.com/api/objects',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"filter":{"where":{"operator":"=","args":["id",5]}},"context":{"tableName":"245ce633-796f-4dfa-ae6f-4b2762adbf44"}})

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
$request->setUrl('https://mycooldomain.com/api/objects');
$request->setMethod(HTTP_Request2::METHOD_DELETE);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "filter": {\n        "where": {\n            "operator": "=",\n            "args": [\n                "id",\n                5\n            ]\n        }\n    },\n    "context": {\n        "tableName": "245ce633-796f-4dfa-ae6f-4b2762adbf44"\n    }\n}');
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
