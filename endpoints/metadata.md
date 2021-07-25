# Spec: Metadata

This API works with database tables.

You can create, retrieve, update and delete your tables.

{% method -%}
## Create

**Method**

    POST

**URI**

    /api/metadata

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "data": [
        {
            "name": "Table 1"
        }
    ],
    "context": {}
}
```

**Result**
```json
[
  {
    "id": 102,
    "name": "Table 1",
    "tableName": "5df11e6e-c9e3-4e29-a499-0fdbce0bd101",
    "description": "Some description",
    "fields": [
      {
        "id": 1,
        "name": "id",
        "allowNull": false,
        "autoIncrement": true,
        "primaryKey": true,
        "type": "integer",
        "extend": {
          "isSystem": true,
          "caption": "ID",
          "order": 0
        }
      },
      {
        "id": 2,
        "name": "createdAt",
        "allowNull": false,
        "type": "datetime",
        "extend": {
          "isSystem": true,
          "caption": "Created At",
          "order": 1000
        }
      },
      {
        "id": 3,
        "name": "updatedAt",
        "allowNull": false,
        "type": "datetime",
        "extend": {
          "isSystem": true,
          "caption": "Updated At",
          "order": 1001
        }
      }
    ],
    "options": {},
    "updatedAt": "2020-04-03T10:23:09.031Z",
    "createdAt": "2020-04-03T10:23:09.031Z"
  }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"data":[{"name":"Table 1"}],"context":{}});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://mycooldomain.com/api/metadata", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://mycooldomain.com/api/metadata',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"data":[{"name":"Table 1"}],"context":{}})

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
$request->setUrl('https://mycooldomain.com/api/metadata');
$request->setMethod(HTTP_Request2::METHOD_POST);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "data": [\n        {\n            "name": "Table 1"\n        }\n    ],\n    "context": {}\n}');
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

**Method**

    GET

**URI**

    /api/metadata

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "filter": {
      "attributes": [
        {
            "column": "id",
            "alias": "metadataId"
        },
        "name",
        {
            "column": "tableName",
            "alias": "metaTableName"
        },
        "fields",
        "createdAt"
      ],
      "where": {
        "operator": "=",
        "args": ["id", 102]
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
        "metadataId": 102,
        "name": "Table 1",
        "metaTableName": "5df11e6e-c9e3-4e29-a499-0fdbce0bd101",
        "fields": [
          {
            "id": 1,
            "name": "id",
            "allowNull": false,
            "autoIncrement": true,
            "primaryKey": true,
            "type": "integer",
            "extend": {
              "isSystem": true,
              "caption": "ID",
              "order": 0
            }
          },
          {
            "id": 2,
            "name": "createdAt",
            "allowNull": false,
            "type": "datetime",
            "extend": {
              "isSystem": true,
              "caption": "Created At",
              "order": 1000
            }
          },
          {
            "id": 3,
            "name": "updatedAt",
            "allowNull": false,
            "type": "datetime",
            "extend": {
              "isSystem": true,
              "caption": "Updated At",
              "order": 1001
            }
          }
        ],
        "createdAt": "2020-04-03T10:23:09.031Z"
    }
  ]
}
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"filter":{"attributes":[{"column":"id","alias":"metadataId"},"name",{"column":"tableName","alias":"metaTableName"},"fields","createdAt"],"where":{"operator":"=","args":["id",131]}},"context":{}});

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://mycooldomain.com/api/metadata", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://mycooldomain.com/api/metadata',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"filter":{"attributes":[{"column":"id","alias":"metadataId"},"name",{"column":"tableName","alias":"metaTableName"},"fields","createdAt"],"where":{"operator":"=","args":["id",131]}},"context":{}})

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
$request->setUrl('https://mycooldomain.com/api/metadata');
$request->setMethod(HTTP_Request2::METHOD_GET);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "filter": {\n        "attributes": [\n            {\n                "column": "id",\n                "alias": "metadataId"\n            },\n            "name",\n            {\n                "column": "tableName",\n                "alias": "metaTableName"\n            },\n            "fields",\n            "createdAt"\n        ],\n        "where": {\n            "operator": "=",\n            "args": [\n                "id",\n                131\n            ]\n        }\n    },\n    "context": {}\n}');
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

This method allows change metadata of table like `name`, `fields`, `description`, `options`.

When changing property `fields` this applies changes to real table columns, so you can add new, rename, remove them,
change their properties: make column Indexed, Mandatory, Encrypted.

**Method**

    PUT

**URI**

    /api/metadata

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "data": [
        {
            "id": 102,
            "name": "Table 2"
        }
    ],
    "context": {}
}
```

**Result**
```json
[
  {
    "id": 102,
    "name": "Table 2",
    "tableName": "5df11e6e-c9e3-4e29-a499-0fdbce0bd101",
    "description": "Some description",
    "fields": [
      {
        "id": 1,
        "name": "id",
        "allowNull": false,
        "autoIncrement": true,
        "primaryKey": true,
        "type": "integer",
        "extend": {
          "isSystem": true,
          "caption": "ID",
          "order": 0
        }
      },
      {
        "id": 2,
        "name": "createdAt",
        "allowNull": false,
        "type": "datetime",
        "extend": {
          "isSystem": true,
          "caption": "Created At",
          "order": 1000
        }
      },
      {
        "id": 3,
        "name": "updatedAt",
        "allowNull": false,
        "type": "datetime",
        "extend": {
          "isSystem": true,
          "caption": "Updated At",
          "order": 1001
        }
      }
    ],
    "options": {},
    "updatedAt": "2020-04-07T10:10:09.031Z",
    "createdAt": "2020-04-03T10:23:09.031Z"
  }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"data":[{"id":131,"name":"Table 2"}],"context":{}});

var requestOptions = {
  method: 'PUT',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://mycooldomain.com/api/metadata", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'PUT',
  'url': 'https://mycooldomain.com/api/metadata',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"data":[{"id":131,"name":"Table 2"}],"context":{}})

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
$request->setUrl('https://mycooldomain.com/api/metadata');
$request->setMethod(HTTP_Request2::METHOD_PUT);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "data": [\n        {\n            "id": 131,\n            "name": "Table 2"\n        }\n    ],\n    "context": {}\n}');
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

This method allows to delete existing metadata with related table in DB

**Method**

    DELETE

**URI**

    /api/metadata

**Headers**

    Content-Type	application/json
    Authorization   Bearer <short-access-token>

**Body**
```json
{
    "filter": {
      "where": {
        "operator": "=",
        "args": ["id", 102]
      }
    },
    "context": {}
}
```

**Result**
```json
[
  {
    "id": 102,
    "name": "Table 2",
    "tableName": "5df11e6e-c9e3-4e29-a499-0fdbce0bd101",
    "description": "Some description",
    "fields": [
      {
        "id": 1,
        "name": "id",
        "allowNull": false,
        "autoIncrement": true,
        "primaryKey": true,
        "type": "integer",
        "extend": {
          "isSystem": true,
          "caption": "ID",
          "order": 0
        }
      },
      {
        "id": 2,
        "name": "createdAt",
        "allowNull": false,
        "type": "datetime",
        "extend": {
          "isSystem": true,
          "caption": "Created At",
          "order": 1000
        }
      },
      {
        "id": 3,
        "name": "updatedAt",
        "allowNull": false,
        "type": "datetime",
        "extend": {
          "isSystem": true,
          "caption": "Updated At",
          "order": 1001
        }
      }
    ],
    "options": {},
    "updatedAt": "2020-04-03T10:23:09.031Z",
    "createdAt": "2020-04-03T10:23:09.031Z"
  }
]
```

{% sample lang="js" -%}
```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer <short-access-token>");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"filter":{"where":{"operator":"=","args":["id",131]}},"context":{}});

var requestOptions = {
  method: 'DELETE',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://mycooldomain.com/api/metadata", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

{% sample lang="nodejs" -%}
```javascript
var request = require('request');
var options = {
  'method': 'DELETE',
  'url': 'https://mycooldomain.com/api/metadata',
  'headers': {
    'Authorization': 'Bearer <short-access-token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"filter":{"where":{"operator":"=","args":["id",131]}},"context":{}})

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
$request->setUrl('https://mycooldomain.com/api/metadata');
$request->setMethod(HTTP_Request2::METHOD_DELETE);
$request->setConfig(array(
  'follow_redirects' => TRUE
));
$request->setHeader(array(
  'Authorization' => 'Bearer <short-access-token>',
  'Content-Type' => 'application/json'
));
$request->setBody('{\n    "filter": {\n        "where": {\n            "operator": "=",\n            "args": [\n                "id",\n                131\n            ]\n        }\n    },\n    "context": {}\n}');
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
